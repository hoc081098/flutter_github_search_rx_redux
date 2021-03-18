// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RepoItem extends RepoItem {
  @override
  final String fullName;
  @override
  final String? language;
  @override
  final int starCount;
  @override
  final String name;
  @override
  final String? description;
  @override
  final Color? languageColor;
  @override
  final String htmlUrl;
  @override
  final Owner owner;

  factory _$RepoItem([void Function(RepoItemBuilder)? updates]) =>
      (new RepoItemBuilder()..update(updates)).build();

  _$RepoItem._(
      {required this.fullName,
      this.language,
      required this.starCount,
      required this.name,
      this.description,
      this.languageColor,
      required this.htmlUrl,
      required this.owner})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(fullName, 'RepoItem', 'fullName');
    BuiltValueNullFieldError.checkNotNull(starCount, 'RepoItem', 'starCount');
    BuiltValueNullFieldError.checkNotNull(name, 'RepoItem', 'name');
    BuiltValueNullFieldError.checkNotNull(htmlUrl, 'RepoItem', 'htmlUrl');
    BuiltValueNullFieldError.checkNotNull(owner, 'RepoItem', 'owner');
  }

  @override
  RepoItem rebuild(void Function(RepoItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RepoItemBuilder toBuilder() => new RepoItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RepoItem &&
        fullName == other.fullName &&
        language == other.language &&
        starCount == other.starCount &&
        name == other.name &&
        description == other.description &&
        languageColor == other.languageColor &&
        htmlUrl == other.htmlUrl &&
        owner == other.owner;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, fullName.hashCode), language.hashCode),
                            starCount.hashCode),
                        name.hashCode),
                    description.hashCode),
                languageColor.hashCode),
            htmlUrl.hashCode),
        owner.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RepoItem')
          ..add('fullName', fullName)
          ..add('language', language)
          ..add('starCount', starCount)
          ..add('name', name)
          ..add('description', description)
          ..add('languageColor', languageColor)
          ..add('htmlUrl', htmlUrl)
          ..add('owner', owner))
        .toString();
  }
}

class RepoItemBuilder implements Builder<RepoItem, RepoItemBuilder> {
  _$RepoItem? _$v;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  int? _starCount;
  int? get starCount => _$this._starCount;
  set starCount(int? starCount) => _$this._starCount = starCount;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  Color? _languageColor;
  Color? get languageColor => _$this._languageColor;
  set languageColor(Color? languageColor) =>
      _$this._languageColor = languageColor;

  String? _htmlUrl;
  String? get htmlUrl => _$this._htmlUrl;
  set htmlUrl(String? htmlUrl) => _$this._htmlUrl = htmlUrl;

  OwnerBuilder? _owner;
  OwnerBuilder get owner => _$this._owner ??= new OwnerBuilder();
  set owner(OwnerBuilder? owner) => _$this._owner = owner;

  RepoItemBuilder();

  RepoItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fullName = $v.fullName;
      _language = $v.language;
      _starCount = $v.starCount;
      _name = $v.name;
      _description = $v.description;
      _languageColor = $v.languageColor;
      _htmlUrl = $v.htmlUrl;
      _owner = $v.owner.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RepoItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RepoItem;
  }

  @override
  void update(void Function(RepoItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RepoItem build() {
    _$RepoItem _$result;
    try {
      _$result = _$v ??
          new _$RepoItem._(
              fullName: BuiltValueNullFieldError.checkNotNull(
                  fullName, 'RepoItem', 'fullName'),
              language: language,
              starCount: BuiltValueNullFieldError.checkNotNull(
                  starCount, 'RepoItem', 'starCount'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, 'RepoItem', 'name'),
              description: description,
              languageColor: languageColor,
              htmlUrl: BuiltValueNullFieldError.checkNotNull(
                  htmlUrl, 'RepoItem', 'htmlUrl'),
              owner: owner.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'owner';
        owner.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RepoItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Owner extends Owner {
  @override
  final String username;
  @override
  final String avatar;

  factory _$Owner([void Function(OwnerBuilder)? updates]) =>
      (new OwnerBuilder()..update(updates)).build();

  _$Owner._({required this.username, required this.avatar}) : super._() {
    BuiltValueNullFieldError.checkNotNull(username, 'Owner', 'username');
    BuiltValueNullFieldError.checkNotNull(avatar, 'Owner', 'avatar');
  }

  @override
  Owner rebuild(void Function(OwnerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OwnerBuilder toBuilder() => new OwnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Owner &&
        username == other.username &&
        avatar == other.avatar;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, username.hashCode), avatar.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Owner')
          ..add('username', username)
          ..add('avatar', avatar))
        .toString();
  }
}

class OwnerBuilder implements Builder<Owner, OwnerBuilder> {
  _$Owner? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  OwnerBuilder();

  OwnerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _avatar = $v.avatar;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Owner other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Owner;
  }

  @override
  void update(void Function(OwnerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Owner build() {
    final _$result = _$v ??
        new _$Owner._(
            username: BuiltValueNullFieldError.checkNotNull(
                username, 'Owner', 'username'),
            avatar: BuiltValueNullFieldError.checkNotNull(
                avatar, 'Owner', 'avatar'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
