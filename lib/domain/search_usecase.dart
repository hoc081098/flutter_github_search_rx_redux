import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_github_search_rx_redux/domain/search_repo.dart';
import 'package:meta/meta.dart';

import 'repo_item.dart';

class SearchUseCase {
  final SearchRepository _repository;

  SearchUseCase(this._repository);

  Future<BuiltList<RepoItem>> call({
    @required String term,
    @required int page,
  }) =>
      _repository.searchBy(term: term, page: page);
}
