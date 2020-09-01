import 'dart:ui';

import 'package:built_value/built_value.dart';

part 'repo_item.g.dart';

abstract class RepoItem implements Built<RepoItem, RepoItemBuilder> {
  String get fullName;

  @nullable
  String get language;

  int get starCount;

  String get name;

  @nullable
  String get description;

  @nullable
  Color get languageColor;

  String get htmlUrl;

  Owner get owner;

  RepoItem._();

  factory RepoItem([void Function(RepoItemBuilder) updates]) = _$RepoItem;
}

abstract class Owner implements Built<Owner, OwnerBuilder> {
  String get username;

  String get avatar;

  Owner._();

  factory Owner([void Function(OwnerBuilder) updates]) = _$Owner;
}
