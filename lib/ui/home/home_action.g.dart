// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_action.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchAction extends SearchAction {
  @override
  final String term;

  factory _$SearchAction([void Function(SearchActionBuilder)? updates]) =>
      (new SearchActionBuilder()..update(updates))._build();

  _$SearchAction._({required this.term}) : super._() {
    BuiltValueNullFieldError.checkNotNull(term, r'SearchAction', 'term');
  }

  @override
  SearchAction rebuild(void Function(SearchActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchActionBuilder toBuilder() => new SearchActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchAction && term == other.term;
  }

  @override
  int get hashCode {
    return $jf($jc(0, term.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SearchAction')..add('term', term))
        .toString();
  }
}

class SearchActionBuilder
    implements Builder<SearchAction, SearchActionBuilder> {
  _$SearchAction? _$v;

  String? _term;
  String? get term => _$this._term;
  set term(String? term) => _$this._term = term;

  SearchActionBuilder();

  SearchActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _term = $v.term;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchAction;
  }

  @override
  void update(void Function(SearchActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchAction build() => _build();

  _$SearchAction _build() {
    final _$result = _$v ??
        new _$SearchAction._(
            term: BuiltValueNullFieldError.checkNotNull(
                term, r'SearchAction', 'term'));
    replace(_$result);
    return _$result;
  }
}

class _$TextChangedAction extends TextChangedAction {
  @override
  final String term;

  factory _$TextChangedAction(
          [void Function(TextChangedActionBuilder)? updates]) =>
      (new TextChangedActionBuilder()..update(updates))._build();

  _$TextChangedAction._({required this.term}) : super._() {
    BuiltValueNullFieldError.checkNotNull(term, r'TextChangedAction', 'term');
  }

  @override
  TextChangedAction rebuild(void Function(TextChangedActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextChangedActionBuilder toBuilder() =>
      new TextChangedActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextChangedAction && term == other.term;
  }

  @override
  int get hashCode {
    return $jf($jc(0, term.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TextChangedAction')
          ..add('term', term))
        .toString();
  }
}

class TextChangedActionBuilder
    implements Builder<TextChangedAction, TextChangedActionBuilder> {
  _$TextChangedAction? _$v;

  String? _term;
  String? get term => _$this._term;
  set term(String? term) => _$this._term = term;

  TextChangedActionBuilder();

  TextChangedActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _term = $v.term;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TextChangedAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextChangedAction;
  }

  @override
  void update(void Function(TextChangedActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextChangedAction build() => _build();

  _$TextChangedAction _build() {
    final _$result = _$v ??
        new _$TextChangedAction._(
            term: BuiltValueNullFieldError.checkNotNull(
                term, r'TextChangedAction', 'term'));
    replace(_$result);
    return _$result;
  }
}

class _$SearchLoadingAction extends SearchLoadingAction {
  @override
  final String term;
  @override
  final int nextPage;

  factory _$SearchLoadingAction(
          [void Function(SearchLoadingActionBuilder)? updates]) =>
      (new SearchLoadingActionBuilder()..update(updates))._build();

  _$SearchLoadingAction._({required this.term, required this.nextPage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(term, r'SearchLoadingAction', 'term');
    BuiltValueNullFieldError.checkNotNull(
        nextPage, r'SearchLoadingAction', 'nextPage');
  }

  @override
  SearchLoadingAction rebuild(
          void Function(SearchLoadingActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchLoadingActionBuilder toBuilder() =>
      new SearchLoadingActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchLoadingAction &&
        term == other.term &&
        nextPage == other.nextPage;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, term.hashCode), nextPage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SearchLoadingAction')
          ..add('term', term)
          ..add('nextPage', nextPage))
        .toString();
  }
}

class SearchLoadingActionBuilder
    implements Builder<SearchLoadingAction, SearchLoadingActionBuilder> {
  _$SearchLoadingAction? _$v;

  String? _term;
  String? get term => _$this._term;
  set term(String? term) => _$this._term = term;

  int? _nextPage;
  int? get nextPage => _$this._nextPage;
  set nextPage(int? nextPage) => _$this._nextPage = nextPage;

  SearchLoadingActionBuilder();

  SearchLoadingActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _term = $v.term;
      _nextPage = $v.nextPage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchLoadingAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchLoadingAction;
  }

  @override
  void update(void Function(SearchLoadingActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchLoadingAction build() => _build();

  _$SearchLoadingAction _build() {
    final _$result = _$v ??
        new _$SearchLoadingAction._(
            term: BuiltValueNullFieldError.checkNotNull(
                term, r'SearchLoadingAction', 'term'),
            nextPage: BuiltValueNullFieldError.checkNotNull(
                nextPage, r'SearchLoadingAction', 'nextPage'));
    replace(_$result);
    return _$result;
  }
}

class _$SearchSuccessAction extends SearchSuccessAction {
  @override
  final String term;
  @override
  final BuiltList<RepoItem> items;

  factory _$SearchSuccessAction(
          [void Function(SearchSuccessActionBuilder)? updates]) =>
      (new SearchSuccessActionBuilder()..update(updates))._build();

  _$SearchSuccessAction._({required this.term, required this.items})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(term, r'SearchSuccessAction', 'term');
    BuiltValueNullFieldError.checkNotNull(
        items, r'SearchSuccessAction', 'items');
  }

  @override
  SearchSuccessAction rebuild(
          void Function(SearchSuccessActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchSuccessActionBuilder toBuilder() =>
      new SearchSuccessActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchSuccessAction &&
        term == other.term &&
        items == other.items;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, term.hashCode), items.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SearchSuccessAction')
          ..add('term', term)
          ..add('items', items))
        .toString();
  }
}

class SearchSuccessActionBuilder
    implements Builder<SearchSuccessAction, SearchSuccessActionBuilder> {
  _$SearchSuccessAction? _$v;

  String? _term;
  String? get term => _$this._term;
  set term(String? term) => _$this._term = term;

  ListBuilder<RepoItem>? _items;
  ListBuilder<RepoItem> get items =>
      _$this._items ??= new ListBuilder<RepoItem>();
  set items(ListBuilder<RepoItem>? items) => _$this._items = items;

  SearchSuccessActionBuilder();

  SearchSuccessActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _term = $v.term;
      _items = $v.items.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchSuccessAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchSuccessAction;
  }

  @override
  void update(void Function(SearchSuccessActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchSuccessAction build() => _build();

  _$SearchSuccessAction _build() {
    _$SearchSuccessAction _$result;
    try {
      _$result = _$v ??
          new _$SearchSuccessAction._(
              term: BuiltValueNullFieldError.checkNotNull(
                  term, r'SearchSuccessAction', 'term'),
              items: items.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SearchSuccessAction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$SearchFailureAction extends SearchFailureAction {
  @override
  final String term;
  @override
  final Object error;

  factory _$SearchFailureAction(
          [void Function(SearchFailureActionBuilder)? updates]) =>
      (new SearchFailureActionBuilder()..update(updates))._build();

  _$SearchFailureAction._({required this.term, required this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(term, r'SearchFailureAction', 'term');
    BuiltValueNullFieldError.checkNotNull(
        error, r'SearchFailureAction', 'error');
  }

  @override
  SearchFailureAction rebuild(
          void Function(SearchFailureActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchFailureActionBuilder toBuilder() =>
      new SearchFailureActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchFailureAction &&
        term == other.term &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, term.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SearchFailureAction')
          ..add('term', term)
          ..add('error', error))
        .toString();
  }
}

class SearchFailureActionBuilder
    implements Builder<SearchFailureAction, SearchFailureActionBuilder> {
  _$SearchFailureAction? _$v;

  String? _term;
  String? get term => _$this._term;
  set term(String? term) => _$this._term = term;

  Object? _error;
  Object? get error => _$this._error;
  set error(Object? error) => _$this._error = error;

  SearchFailureActionBuilder();

  SearchFailureActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _term = $v.term;
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchFailureAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchFailureAction;
  }

  @override
  void update(void Function(SearchFailureActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchFailureAction build() => _build();

  _$SearchFailureAction _build() {
    final _$result = _$v ??
        new _$SearchFailureAction._(
            term: BuiltValueNullFieldError.checkNotNull(
                term, r'SearchFailureAction', 'term'),
            error: BuiltValueNullFieldError.checkNotNull(
                error, r'SearchFailureAction', 'error'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
