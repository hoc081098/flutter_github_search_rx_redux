import 'dart:ui';

import 'package:built_collection/built_collection.dart';

import '../../domain/repo_item.dart';
import 'search_result.dart';

BuiltList<RepoItem> searchResultToRepoItems(
  SearchResult result,
  BuiltMap<String, Color> colors,
) =>
    result.items
        ?.map(
          (item) => _itemToRepoItem(
            item,
            item.language == null ? null : colors[item.language],
          ),
        )
        .toBuiltList() ??
    <RepoItem>[].build();

RepoItem _itemToRepoItem(SearchResultItem item, Color? color) => RepoItem(
      (b) => b
        ..fullName = item.fullName
        ..language = item.language
        ..starCount = item.stargazersCount
        ..description = item.description
        ..name = item.name
        ..languageColor = color
        ..htmlUrl = item.htmlUrl
        ..owner = (b.owner
          ..update((ob) => ob
            ..username = item.owner.login
            ..avatar = item.owner.avatarUrl)),
    );
