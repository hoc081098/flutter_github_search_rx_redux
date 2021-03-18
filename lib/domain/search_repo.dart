import 'dart:async';

import 'package:built_collection/built_collection.dart';

import 'repo_item.dart';

abstract class SearchRepository {
  Future<BuiltList<RepoItem>> searchBy({
    required String term,
    required int page,
  });
}
