import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter_github_search_rx_redux/domain/repo_item.dart';
import 'package:flutter_github_search_rx_redux/ui/home/home_state.dart';

part 'home_action.g.dart';

abstract class HomeAction {
  HomeState reduce(HomeState state);
}

//
// User's input actions
//

abstract class SearchAction
    implements Built<SearchAction, SearchActionBuilder>, HomeAction {
  String get term;

  SearchAction._();

  factory SearchAction([void Function(SearchActionBuilder) updates]) =
      _$SearchAction;

  @override
  HomeState reduce(HomeState state) => state;
}

class LoadNextPageAction implements HomeAction {
  const LoadNextPageAction();

  @override
  HomeState reduce(HomeState state) => state;
}

class RetryAction implements HomeAction {
  const RetryAction();

  @override
  HomeState reduce(HomeState state) => state;
}

//
// Side effect actions
//

abstract class SearchLoadingAction
    implements
        Built<SearchLoadingAction, SearchLoadingActionBuilder>,
        HomeAction {
  String get term;

  int get page;

  SearchLoadingAction._();

  factory SearchLoadingAction(
          [void Function(SearchLoadingActionBuilder) updates]) =
      _$SearchLoadingAction;

  @override
  HomeState reduce(HomeState state) {
    if (page == 1) {
      return state.rebuild((b) => b
        ..term = term
        ..page = 0
        ..isLoading = true
        ..error = null
        ..items = ListBuilder<RepoItem>());
    } else {
      return state.rebuild((b) => b
        ..term = term
        ..isLoading = true
        ..error = null);
    }
  }
}

abstract class SearchSuccessAction
    implements
        Built<SearchSuccessAction, SearchSuccessActionBuilder>,
        HomeAction {
  String get term;

  BuiltList<RepoItem> get items;

  SearchSuccessAction._();

  factory SearchSuccessAction(
          [void Function(SearchSuccessActionBuilder) updates]) =
      _$SearchSuccessAction;

  @override
  HomeState reduce(HomeState state) {
    return state.rebuild(
      (b) => b
        ..page = state.page + (items.isEmpty ? 0 : 1)
        ..term = term
        ..items = (b.items
          ..update(
              (ib) => state.isFirstPage ? ib.replace(items) : ib.addAll(items)))
        ..error = null
        ..isLoading = false,
    );
  }
}

abstract class SearchFailureAction
    implements
        Built<SearchFailureAction, SearchFailureActionBuilder>,
        HomeAction {
  String get term;

  @nullable
  Object get error;

  SearchFailureAction._();

  factory SearchFailureAction(
          [void Function(SearchFailureActionBuilder) updates]) =
      _$SearchFailureAction;

  @override
  HomeState reduce(HomeState state) {
    return state.rebuild(
      (b) => b
        ..items = ListBuilder<RepoItem>()
        ..term = term
        ..error = error
        ..isLoading = false,
    );
  }
}
