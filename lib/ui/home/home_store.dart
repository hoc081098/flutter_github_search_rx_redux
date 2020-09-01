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

  List<SideEffect<HomeAction, HomeState>> call() => [
        searchActionToTextChangedAction,
        search,
        nextPage,
        retry,
      ];

  Stream<HomeAction> searchActionToTextChangedAction(
    Stream<HomeAction> actions,
    GetState<HomeState> getState,
  ) =>
      actions
          .whereType<SearchAction>()
          .debounceTime(const Duration(milliseconds: 500))
          .map((action) => action.term.trim())
          .where((term) => term.isNotEmpty)
          .distinct()
          .map((term) => TextChangedAction((b) => b..term = term));

  Stream<HomeAction> search(
    Stream<HomeAction> actions,
    GetState<HomeState> getState,
  ) =>
      actions
          .whereType<TextChangedAction>()
          .map((action) => action.term)
          .switchMap((term) => _nextPage(term, 1));

  Stream<HomeAction> nextPage(
    Stream<HomeAction> actions,
    GetState<HomeState> getState,
  ) {
    final textChangedAction$ = actions.whereType<TextChangedAction>();

    return actions
        .whereType<LoadNextPageAction>()
        .map((_) => getState())
        .where((state) => state.canLoadNextPage)
        .exhaustMap((state) => _nextPage(state.term, state.page + 1)
            .takeUntil(textChangedAction$));
  }

  Stream<HomeAction> retry(
    Stream<HomeAction> actions,
    GetState<HomeState> getState,
  ) {
    final textChangedAction$ = actions.whereType<TextChangedAction>();

    return actions
        .whereType<RetryAction>()
        .map((_) => getState())
        .where((state) => state.canRetry)
        .exhaustMap((state) => _nextPage(state.term, state.page + 1)
            .takeUntil(textChangedAction$));
  }

  Stream<HomeAction> _nextPage(String term, int nextPage) {
    final loadingAction = SearchLoadingAction((b) => b
      ..term = term
      ..nextPage = nextPage);

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
