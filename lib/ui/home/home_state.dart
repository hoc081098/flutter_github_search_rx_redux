import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter_github_search_rx_redux/domain/repo_item.dart';

part 'home_state.g.dart';

abstract class HomeState implements Built<HomeState, HomeStateBuilder> {
  int get page;

  String get term;

  BuiltList<RepoItem> get items;

  bool get isLoading;

  @nullable
  Object get error;

  HomeState._();

  factory HomeState([void Function(HomeStateBuilder) updates]) = _$HomeState;

  factory HomeState.initial() => HomeState(
        (b) => b
          ..page = 0
          ..term = ''
          ..isLoading = false,
      );

  bool get isFirstPage => page == 0;

  bool get canLoadNextPage =>
      !isLoading &&
      error == null &&
      items.isNotEmpty &&
      term.isNotEmpty &&
      page > 0;

  bool get canRetry => !isLoading && error != null;
}
