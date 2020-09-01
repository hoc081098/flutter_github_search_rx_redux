// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_action.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchAction extends SearchAction {
  @override
  final String term;

  factory _$SearchAction([void Function(SearchActionBuilder) updates]) =>
      (new SearchActionBuilder()..update(updates)).build();

  _$SearchAction._({this.term}) : super._() {
    if (term == null) {
      throw new BuiltValueNullFieldError('SearchAction', 'term');
    }
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
    return (newBuiltValueToStringHelper('SearchAction')..add('term', term))
        .toString();
  }
}

class SearchActionBuilder
    implements Builder<SearchAction, SearchActionBuilder> {
  _$SearchAction _$v;

  String _term;
  String get term => _$this._term;
  set term(String term) => _$this._term = term;

  SearchActionBuilder();

  SearchActionBuilder get _$this {
    if (_$v != null) {
      _term = _$v.term;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchAction other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchAction;
  }

  @override
  void update(void Function(SearchActionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchAction build() {
    final _$result = _$v ?? new _$SearchAction._(term: term);
    replace(_$result);
    return _$result;
  }
}

class _$SearchLoadingAction extends SearchLoadingAction {
  @override
  final String term;
  @override
  final int page;

  factory _$SearchLoadingAction(
          [void Function(SearchLoadingActionBuilder) updates]) =>
      (new SearchLoadingActionBuilder()..update(updates)).build();

  _$SearchLoadingAction._({this.term, this.page}) : super._() {
    if (term == null) {
      throw new BuiltValueNullFieldError('SearchLoadingAction', 'term');
    }
    if (page == null) {
      throw new BuiltValueNullFieldError('SearchLoadingAction', 'page');
    }
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
        page == other.page;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, term.hashCode), page.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchLoadingAction')
          ..add('term', term)
          ..add('page', page))
        .toString();
  }
}

class SearchLoadingActionBuilder
    implements Builder<SearchLoadingAction, SearchLoadingActionBuilder> {
  _$SearchLoadingAction _$v;

  String _term;
  String get term => _$this._term;
  set term(String term) => _$this._term = term;

  int _page;
  int get page => _$this._page;
  set page(int page) => _$this._page = page;

  SearchLoadingActionBuilder();

  SearchLoadingActionBuilder get _$this {
    if (_$v != null) {
      _term = _$v.term;
      _page = _$v.page;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchLoadingAction other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchLoadingAction;
  }

  @override
  void update(void Function(SearchLoadingActionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchLoadingAction build() {
    final _$result = _$v ?? new _$SearchLoadingAction._(term: term, page: page);
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
          [void Function(SearchSuccessActionBuilder) updates]) =>
      (new SearchSuccessActionBuilder()..update(updates)).build();

  _$SearchSuccessAction._({this.term, this.items}) : super._() {
    if (term == null) {
      throw new BuiltValueNullFieldError('SearchSuccessAction', 'term');
    }
    if (items == null) {
      throw new BuiltValueNullFieldError('SearchSuccessAction', 'items');
    }
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
    return (newBuiltValueToStringHelper('SearchSuccessAction')
          ..add('term', term)
          ..add('items', items))
        .toString();
  }
}

class SearchSuccessActionBuilder
    implements Builder<SearchSuccessAction, SearchSuccessActionBuilder> {
  _$SearchSuccessAction _$v;

  String _term;
  String get term => _$this._term;
  set term(String term) => _$this._term = term;

  ListBuilder<RepoItem> _items;
  ListBuilder<RepoItem> get items =>
      _$this._items ??= new ListBuilder<RepoItem>();
  set items(ListBuilder<RepoItem> items) => _$this._items = items;

  SearchSuccessActionBuilder();

  SearchSuccessActionBuilder get _$this {
    if (_$v != null) {
      _term = _$v.term;
      _items = _$v.items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchSuccessAction other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchSuccessAction;
  }

  @override
  void update(void Function(SearchSuccessActionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchSuccessAction build() {
    _$SearchSuccessAction _$result;
    try {
      _$result =
          _$v ?? new _$SearchSuccessAction._(term: term, items: items.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SearchSuccessAction', _$failedField, e.toString());
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
          [void Function(SearchFailureActionBuilder) updates]) =>
      (new SearchFailureActionBuilder()..update(updates)).build();

  _$SearchFailureAction._({this.term, this.error}) : super._() {
    if (term == null) {
      throw new BuiltValueNullFieldError('SearchFailureAction', 'term');
    }
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
    return (newBuiltValueToStringHelper('SearchFailureAction')
          ..add('term', term)
          ..add('error', error))
        .toString();
  }
}

class SearchFailureActionBuilder
    implements Builder<SearchFailureAction, SearchFailureActionBuilder> {
  _$SearchFailureAction _$v;

  String _term;
  String get term => _$this._term;
  set term(String term) => _$this._term = term;

  Object _error;
  Object get error => _$this._error;
  set error(Object error) => _$this._error = error;

  SearchFailureActionBuilder();

  SearchFailureActionBuilder get _$this {
    if (_$v != null) {
      _term = _$v.term;
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchFailureAction other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchFailureAction;
  }

  @override
  void update(void Function(SearchFailureActionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchFailureAction build() {
    final _$result =
        _$v ?? new _$SearchFailureAction._(term: term, error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
