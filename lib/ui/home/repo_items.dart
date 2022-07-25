import 'package:flutter/material.dart';
import 'package:flutter_github_search_rx_redux/ui/home/home_action.dart';
import 'package:flutter_github_search_rx_redux/ui/home/home_state.dart';
import 'package:flutter_github_search_rx_redux/ui/home/repo_item.dart';
import 'package:loading_indicator/loading_indicator.dart';

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
          return RepoItemWidget(
            item: item,
            key: ValueKey(item.htmlUrl),
          );
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
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () => dispatch(const RetryAction()),
                    style: ElevatedButton.styleFrom(
                      elevation: 12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
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
                colors: [
                  Theme.of(context).colorScheme.secondary,
                ],
                indicatorType: Indicator.ballScaleMultiple,
              ),
            ),
          );
        }

        if (state.hasReachedMax) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: () => dispatch(const LoadNextPageAction()),
                style: ElevatedButton.styleFrom(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
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
