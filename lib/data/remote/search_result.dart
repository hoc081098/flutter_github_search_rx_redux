import 'dart:convert';

import 'package:collection/collection.dart';

class SearchResult {
  SearchResult({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  final int totalCount;
  final bool incompleteResults;
  final List<SearchResultItem>? items;

  factory SearchResult.fromRawJson(String str) =>
      SearchResult.fromJson(json.decode(str));

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        totalCount: json['total_count'],
        incompleteResults: json['incomplete_results'],
        items: json['items'] == null
            ? null
            : List<SearchResultItem>.from(
                json['items'].map((x) => SearchResultItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'total_count': totalCount,
        'incomplete_results': incompleteResults,
        'items': items?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchResult &&
          runtimeType == other.runtimeType &&
          totalCount == other.totalCount &&
          incompleteResults == other.incompleteResults &&
          const ListEquality<SearchResultItem>().equals(items, other.items);

  @override
  int get hashCode =>
      totalCount.hashCode ^
      incompleteResults.hashCode ^
      const ListEquality<SearchResultItem>().hash(items);
}

class SearchResultItem {
  final String fullName;
  final SearchResultItemOwner owner;
  final int stargazersCount;
  final String? language;
  final String name;
  final String? description;
  final String htmlUrl;

  SearchResultItem({
    required this.fullName,
    required this.owner,
    required this.stargazersCount,
    required this.language,
    required this.name,
    required this.description,
    required this.htmlUrl,
  });

  factory SearchResultItem.fromJson(Map<String, dynamic> json) =>
      SearchResultItem(
        fullName: json['full_name'],
        owner: SearchResultItemOwner.fromJson(json['owner']),
        stargazersCount: json['stargazers_count'],
        language: json['language'],
        name: json['name'],
        description: json['description'],
        htmlUrl: json['html_url'],
      );

  Map<String, dynamic> toJson() => {
        'full_name': fullName,
        'owner': owner.toJson(),
        'stargazers_count': stargazersCount,
        'language': language,
        'name': name,
        'description': description,
        'html_url': htmlUrl,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchResultItem &&
          runtimeType == other.runtimeType &&
          fullName == other.fullName &&
          owner == other.owner &&
          stargazersCount == other.stargazersCount &&
          language == other.language &&
          name == other.name &&
          description == other.description &&
          htmlUrl == other.htmlUrl;

  @override
  int get hashCode =>
      fullName.hashCode ^
      owner.hashCode ^
      stargazersCount.hashCode ^
      language.hashCode ^
      name.hashCode ^
      description.hashCode ^
      htmlUrl.hashCode;
}

class SearchResultItemOwner {
  SearchResultItemOwner({
    required this.login,
    required this.avatarUrl,
  });

  final String login;

  final String avatarUrl;

  factory SearchResultItemOwner.fromJson(Map<String, dynamic> json) =>
      SearchResultItemOwner(
        login: json['login'],
        avatarUrl: json['avatar_url'],
      );

  Map<String, dynamic> toJson() => {
        'login': login,
        'avatar_url': avatarUrl,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchResultItemOwner &&
          runtimeType == other.runtimeType &&
          login == other.login &&
          avatarUrl == other.avatarUrl;

  @override
  int get hashCode => login.hashCode ^ avatarUrl.hashCode;
}
