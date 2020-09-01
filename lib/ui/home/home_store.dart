import 'package:flutter_github_search_rx_redux/domain/search_usecase.dart';
import 'package:rx_redux/rx_redux.dart';
import 'package:rxdart/rxdart.dart';

import 'home_action.dart';
import 'home_state.dart';

RxReduxStore<HomeAction, HomeState> createStore(SearchUseCase searchUseCase) =>
    RxReduxStore(
      initialState: HomeState.initial(),
      sideEffects: HomeSideEffects(searchUseCase)(),
      reducer: (state, action) => action.reduce(state),
      // logger: rxReduxDefaultLogger,
    );

class HomeSideEffects {
  final SearchUseCase _searchUseCase;

  HomeSideEffects(this._searchUseCase);

  List<SideEffect<HomeAction, HomeState>> call() => [search, nextPage];

  Stream<HomeAction> search(
    Stream<HomeAction> action,
    GetState<HomeState> getState,
  ) =>
      action
          .whereType<SearchAction>()
          .debounceTime(const Duration(milliseconds: 500))
          .map((action) => action.term.trim())
          .where((term) => term.isNotEmpty)
          .distinct()
          .switchMap((term) => _nextPage(term, 1));

  Stream<HomeAction> nextPage(
    Stream<HomeAction> actions,
    GetState<HomeState> getState,
  ) {
    final loadingFirstPage = actions
        .where((action) => action is SearchLoadingAction && action.page == 1);

    return actions
        .whereType<LoadNextPageAction>()
        .map((_) => getState())
        .where((state) =>
            !state.isLoading &&
            state.error == null &&
            state.items.isNotEmpty &&
            state.term.isNotEmpty &&
            state.page > 0)
        .exhaustMap((state) =>
            _nextPage(state.term, state.page + 1).takeUntil(loadingFirstPage));
  }

  Stream<HomeAction> _nextPage(String term, int nextPage) {
    final loadingAction = SearchLoadingAction((b) => b
      ..term = term
      ..page = nextPage);

    return Rx.defer(() => _searchUseCase(term: term, page: nextPage).asStream())
        .map<HomeAction>(
          (items) => SearchSuccessAction((b) => b
            ..term = term
            ..items.replace(items)),
        )
        .startWith(loadingAction)
        .onErrorReturnWith(
          (error) => SearchFailureAction((b) => b
            ..error = error
            ..term = term),
        );
  }
}
