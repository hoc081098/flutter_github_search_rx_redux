import 'dart:ui';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_github_search_rx_redux/data/remote/color_remote_source.dart';
import 'package:flutter_github_search_rx_redux/data/remote/search_result.dart';
import 'package:rxdart_ext/single.dart';

import '../domain/repo_item.dart';
import '../domain/search_repo.dart';
import 'remote/search_remote_source.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteSource _searchRemoteSource;
  final ColorRemoteSource _colorRemoteSource;
  final BuiltList<RepoItem> Function(
      SearchResult, BuiltMap<String, Color> colors) _searchResultToRepoItems;

  SearchRepositoryImpl(
    this._searchRemoteSource,
    this._searchResultToRepoItems,
    this._colorRemoteSource,
  );

  @override
  Single<BuiltList<RepoItem>> searchBy({
    required String term,
    required int page,
  }) =>
      RxSingles.forkJoin2(
        _searchRemoteSource.search(term, page),
        _colorRemoteSource.getColors(),
        _searchResultToRepoItems,
      );
}
