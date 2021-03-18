import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/flutter_bloc_pattern.dart';
import 'package:flutter_disposebag/flutter_disposebag.dart';
import 'package:flutter_github_search_rx_redux/domain/repo_item.dart';
import 'package:flutter_github_search_rx_redux/domain/search_usecase.dart';
import 'package:flutter_github_search_rx_redux/ui/home/home_action.dart';
import 'package:flutter_github_search_rx_redux/ui/home/home_state.dart';
import 'package:flutter_github_search_rx_redux/ui/home/home_store.dart';
import 'package:flutter_provider/flutter_provider.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rx_redux/rx_redux.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with DisposeBagMixin {
  late final store = createStore(Provider.of<SearchUseCase>(context));
  Object? subscribedStore;

  @override
  void initState() {
    super.initState();

    store
        .select((state) => state.page)
        .listen((page) => print('Page: $page'))
        .disposedBy(bag);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    subscribedStore ??= store.actionStream.listen((action) {
      if (action is SearchFailureAction) {
        print(action.error);
        context.snackBar('Error occurred');
      }
    }).disposedBy(bag);
  }

  @override
  void dispose() {
    super.dispose();
    store.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github repo search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                hintText: 'Search...',
                border: OutlineInputBorder(),
              ),
              onChanged: (v) =>
                  store.dispatch(SearchAction((b) => b..term = v)),
            ),
          ),
          Expanded(
            child: RxStreamBuilder<HomeState>(
              stream: store.stateStream,
              builder: (context, state) {
                if (state!.isLoading && state.isFirstPage) {
                  return Center(
                    child: SizedBox(
                      width: 56,
                      height: 56,
                      child: LoadingIndicator(
                        color: Theme.of(context).accentColor,
                        indicatorType: Indicator.ballScaleMultiple,
                      ),
                    ),
                  );
                }

                if (state.error != null && state.isFirstPage) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Search for '${state.term}' error: ${state.error}'",
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: 128,
                            height: 48,
                            child: RaisedButton(
                              onPressed: () =>
                                  store.dispatch(const RetryAction()),
                              elevation: 12,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)),
                              child: Text('Retry'),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }

                if (state.items.isEmpty && state.term.trim().isNotEmpty) {
                  return Center(
                    child: Text(
                      "Search for '${state.term}' empty results",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  );
                }

                return RepoItemsListWidget(
                  state: state,
                  dispatch: store.dispatch,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RepoItemsListWidget extends StatelessWidget {
  const RepoItemsListWidget({
    Key? key,
    required this.state,
    required this.dispatch,
  }) : super(key: key);

  final HomeState state;
  final void Function(HomeAction) dispatch;

  @override
  Widget build(BuildContext context) {
    final items = state.items;

    return ListView.separated(
      itemCount: items.length + (state.isFirstPage ? 0 : 1),
      itemBuilder: (context, index) {
        if (index < items.length) {
          final item = items[index];
          return RepoItemWidget(item: item);
        }

        if (state.error != null) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Search for '${state.term}', page: ${state.page + 1} error: ${state.error}",
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 128,
                  height: 48,
                  child: RaisedButton(
                    onPressed: () => dispatch(const RetryAction()),
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: Text('Retry'),
                  ),
                ),
              ],
            ),
          );
        }

        if (state.isLoading) {
          return Center(
            child: SizedBox(
              width: 56,
              height: 56,
              child: LoadingIndicator(
                color: Theme.of(context).accentColor,
                indicatorType: Indicator.ballScaleMultiple,
              ),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Center(
            child: SizedBox(
              width: 128,
              height: 48,
              child: RaisedButton(
                onPressed: () => dispatch(const LoadNextPageAction()),
                elevation: 12,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                child: Text('Load next page'),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}

class RepoItemWidget extends StatelessWidget {
  const RepoItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final RepoItem item;

  @override
  Widget build(BuildContext context) {
    final languageColor = item.languageColor;
    final description = item.description;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () async {
        if (await canLaunch(item.htmlUrl)) {
          await launch(item.htmlUrl);
        }
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: FadeInImage.assetNetwork(
                width: 96,
                height: 96,
                placeholder: 'assets/icons8-github-96.png',
                image: item.owner.avatar,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  item.fullName,
                  style: textTheme.subtitle1,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                if (description != null)
                  Text(
                    description,
                    style: textTheme.subtitle2!.copyWith(fontSize: 12),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                const SizedBox(height: 16),
                if (item.language != null)
                  Row(
                    children: [
                      if (languageColor != null) ...[
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: languageColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                      Text(
                        item.language ?? 'Unknown language',
                        style: textTheme.subtitle2,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(item.starCount.toString()),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

extension on BuildContext {
  void snackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
