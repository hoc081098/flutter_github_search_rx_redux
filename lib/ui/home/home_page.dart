import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/flutter_bloc_pattern.dart';
import 'package:flutter_disposebag/flutter_disposebag.dart';
import 'package:flutter_github_search_rx_redux/domain/search_usecase.dart';
import 'package:flutter_github_search_rx_redux/ui/home/home_action.dart';
import 'package:flutter_github_search_rx_redux/ui/home/home_state.dart';
import 'package:flutter_github_search_rx_redux/ui/home/home_store.dart';
import 'package:flutter_github_search_rx_redux/ui/home/repo_items.dart';
import 'package:flutter_provider/flutter_provider.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rx_redux/rx_redux.dart';

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
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
          const SizedBox(height: 8),
          RxStreamBuilder<String>(
            stream: store.select((state) => state.term),
            builder: (context, term) {
              return Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                  left: 9,
                ),
                child: Text(
                  "Search results for '$term'",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              );
            },
          ),
          const SizedBox(height: 8),
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
                            'Error: ${state.error}',
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () =>
                                  store.dispatch(const RetryAction()),
                              style: ElevatedButton.styleFrom(
                                elevation: 12,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: Text('Retry'),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }

                if (state.items.isEmpty) {
                  if (state.term.trim().isNotEmpty) {
                    return Center(
                      child: Text(
                        'Empty results',
                        style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        'Search github repositories...',
                        style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
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
