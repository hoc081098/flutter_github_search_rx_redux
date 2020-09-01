import 'dart:ui';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_github_search_rx_redux/data/remote/color_remote_source.dart';
import 'package:flutter_github_search_rx_redux/data/remote/search_result.dart';

import '../domain/repo_item.dart';
import '../domain/search_repo.dart';
import 'remote/search_remote_source.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteSource _searchRemoteSource;
  final ColorRemoteSource _colorRemoteSource;
  final BuiltList<RepoItem> Function(SearchResult, Map<String, Color> colors)
      _searchResultToRepoItems;

  SearchRepositoryImpl(
    this._searchRemoteSource,
    this._searchResultToRepoItems,
    this._colorRemoteSource,
  );

  @override
  Future<BuiltList<RepoItem>> searchBy({String term, int page}) {
    if (term == null) {
      return Future.error(ArgumentError.notNull('term'));
    }
    if (page == null) {
      return Future.error(ArgumentError.notNull('page'));
    }

    return Future.wait([
      _searchRemoteSource.search(term, page),
      _colorRemoteSource.getColors(),
    ]).then(
      (values) => _searchResultToRepoItems(
        values[0] as SearchResult,
        values[1] as Map<String, Color>,
      ),
    );
  }
}
