import 'dart:ui';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_github_search_rx_redux/data/remote/search_result.dart';
import 'package:flutter_github_search_rx_redux/domain/repo_item.dart';

final searchResult = SearchResult(
  incompleteResults: false,
  totalCount: 100,
  items: [
    SearchResultItem(
        fullName: 'Full name 1',
        language: 'Dart',
        stargazersCount: 100,
        description: 'Description 1',
        name: 'Name 1',
        owner: SearchResultItemOwner(
          login: 'hoc081098',
          avatarUrl: 'avatar_hoc081098',
        ),
        htmlUrl: 'url1'),
    SearchResultItem(
        fullName: 'Full name 2',
        language: 'Kotlin',
        stargazersCount: 200,
        description: 'Description 2',
        name: 'Name 2',
        owner: SearchResultItemOwner(
          login: 'petrus_hoc',
          avatarUrl: 'avatar_petrus_hoc',
        ),
        htmlUrl: 'url2'),
  ],
);

final colorsRaw = {
  'Dart': {'color': '#00B4AB'},
  'Kotlin': {'color': '#F18E33'},
};

final colors = {
  'Dart': Color(0xFF00B4AB),
  'Kotlin': Color(0xFFF18E33),
};

final repoItems = BuiltList.of([
  RepoItem(
    (b) => b
      ..fullName = 'Full name 1'
      ..language = 'Dart'
      ..starCount = 100
      ..name = 'Name 1'
      ..description = 'Description 1'
      ..languageColor = colors['Dart']
      ..htmlUrl = 'url1'
      ..owner = (b.owner
        ..update((ob) => ob
          ..username = 'hoc081098'
          ..avatar = 'avatar_hoc081098')),
  ),
  RepoItem(
    (b) => b
      ..fullName = 'Full name 2'
      ..language = 'Kotlin'
      ..starCount = 200
      ..name = 'Name 2'
      ..description = 'Description 2'
      ..languageColor = colors['Kotlin']
      ..htmlUrl = 'url2'
      ..owner = (b.owner
        ..update((ob) => ob
          ..username = 'petrus_hoc'
          ..avatar = 'avatar_petrus_hoc')),
  ),
]);
