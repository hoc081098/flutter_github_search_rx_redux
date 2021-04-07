# flutter_github_search_rx_redux

-   Flutter github search using [rx_redux](https://pub.dev/packages/rx_redux) <br>
-   Functional & reactive programming with [rxdart](https://pub.dev/packages/rxdart), [rx_redux](https://pub.dev/packages/rx_redux) 🚀

<p align="center">
    <img src="https://github.com/hoc081098/rx_redux/blob/v2/images/logo.png?raw=true" alt="Logo" width="300"/>
</p>

## Demo

<p align="center">
    <img src="https://github.com/hoc081098/hoc081098.github.io/blob/master/flutter_github_search_rx_redux/demo.gif?raw=true" height="480" > 
</p>


## Effects with RxDart

```dart
RxReduxStore<HomeAction, HomeState> createStore(SearchUseCase searchUseCase) =>
    RxReduxStore(
      initialState: HomeState.initial(),
      sideEffects: HomeSideEffects(searchUseCase)(),
      reducer: (state, action) => action.reduce(state),
      logger: rxReduxDefaultLogger,
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
    final textChangedAction$ = actions.whereType<TextChangedAction>().debug();

    final performLoadingNextPage = (LoadNextPageAction action) {
      return Stream.value(getState())
          .where((state) => state.canLoadNextPage)
          .exhaustMap((state) => _nextPage(state.term, state.page + 1)
              .takeUntil(textChangedAction$)
              .debug());
    };

    return actions
        .whereType<LoadNextPageAction>()
        .exhaustMap(performLoadingNextPage);
  }

  Stream<HomeAction> retry(
    Stream<HomeAction> actions,
    GetState<HomeState> getState,
  ) {
    final textChangedAction$ = actions.whereType<TextChangedAction>().debug();

    final performRetry = (RetryAction action) {
      return Stream.value(getState())
          .where((state) => state.canRetry)
          .exhaustMap((state) => _nextPage(state.term, state.page + 1)
              .takeUntil(textChangedAction$)
              .debug());
    };

    return actions.whereType<RetryAction>().exhaustMap(performRetry);
  }

  Stream<HomeAction> _nextPage(String term, int nextPage) {
    final loadingAction = SearchLoadingAction((b) => b
      ..term = term
      ..nextPage = nextPage);

    return Rx.fromCallable(() => _searchUseCase(term: term, page: nextPage))
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
```
