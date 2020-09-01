// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HomeState extends HomeState {
  @override
  final int page;
  @override
  final String term;
  @override
  final BuiltList<RepoItem> items;
  @override
  final bool isLoading;
  @override
  final Object error;

  factory _$HomeState([void Function(HomeStateBuilder) updates]) =>
      (new HomeStateBuilder()..update(updates)).build();

  _$HomeState._({this.page, this.term, this.items, this.isLoading, this.error})
      : super._() {
    if (page == null) {
      throw new BuiltValueNullFieldError('HomeState', 'page');
    }
    if (term == null) {
      throw new BuiltValueNullFieldError('HomeState', 'term');
    }
    if (items == null) {
      throw new BuiltValueNullFieldError('HomeState', 'items');
    }
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('HomeState', 'isLoading');
    }
  }

  @override
  HomeState rebuild(void Function(HomeStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HomeStateBuilder toBuilder() => new HomeStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomeState &&
        page == other.page &&
        term == other.term &&
        items == other.items &&
        isLoading == other.isLoading &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, page.hashCode), term.hashCode), items.hashCode),
            isLoading.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HomeState')
          ..add('page', page)
          ..add('term', term)
          ..add('items', items)
          ..add('isLoading', isLoading)
          ..add('error', error))
        .toString();
  }
}

class HomeStateBuilder implements Builder<HomeState, HomeStateBuilder> {
  _$HomeState _$v;

  int _page;
  int get page => _$this._page;
  set page(int page) => _$this._page = page;

  String _term;
  String get term => _$this._term;
  set term(String term) => _$this._term = term;

  ListBuilder<RepoItem> _items;
  ListBuilder<RepoItem> get items =>
      _$this._items ??= new ListBuilder<RepoItem>();
  set items(ListBuilder<RepoItem> items) => _$this._items = items;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  Object _error;
  Object get error => _$this._error;
  set error(Object error) => _$this._error = error;

  HomeStateBuilder();

  HomeStateBuilder get _$this {
    if (_$v != null) {
      _page = _$v.page;
      _term = _$v.term;
      _items = _$v.items?.toBuilder();
      _isLoading = _$v.isLoading;
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HomeState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HomeState;
  }

  @override
  void update(void Function(HomeStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HomeState build() {
    _$HomeState _$result;
    try {
      _$result = _$v ??
          new _$HomeState._(
              page: page,
              term: term,
              items: items.build(),
              isLoading: isLoading,
              error: error);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HomeState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
