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
  final Object? error;
  @override
  final bool hasReachedMax;

  factory _$HomeState([void Function(HomeStateBuilder)? updates]) =>
      (new HomeStateBuilder()..update(updates))._build();

  _$HomeState._(
      {required this.page,
      required this.term,
      required this.items,
      required this.isLoading,
      this.error,
      required this.hasReachedMax})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(page, r'HomeState', 'page');
    BuiltValueNullFieldError.checkNotNull(term, r'HomeState', 'term');
    BuiltValueNullFieldError.checkNotNull(items, r'HomeState', 'items');
    BuiltValueNullFieldError.checkNotNull(isLoading, r'HomeState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        hasReachedMax, r'HomeState', 'hasReachedMax');
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
        error == other.error &&
        hasReachedMax == other.hasReachedMax;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, page.hashCode), term.hashCode), items.hashCode),
                isLoading.hashCode),
            error.hashCode),
        hasReachedMax.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HomeState')
          ..add('page', page)
          ..add('term', term)
          ..add('items', items)
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('hasReachedMax', hasReachedMax))
        .toString();
  }
}

class HomeStateBuilder implements Builder<HomeState, HomeStateBuilder> {
  _$HomeState? _$v;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  String? _term;
  String? get term => _$this._term;
  set term(String? term) => _$this._term = term;

  ListBuilder<RepoItem>? _items;
  ListBuilder<RepoItem> get items =>
      _$this._items ??= new ListBuilder<RepoItem>();
  set items(ListBuilder<RepoItem>? items) => _$this._items = items;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  Object? _error;
  Object? get error => _$this._error;
  set error(Object? error) => _$this._error = error;

  bool? _hasReachedMax;
  bool? get hasReachedMax => _$this._hasReachedMax;
  set hasReachedMax(bool? hasReachedMax) =>
      _$this._hasReachedMax = hasReachedMax;

  HomeStateBuilder();

  HomeStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _page = $v.page;
      _term = $v.term;
      _items = $v.items.toBuilder();
      _isLoading = $v.isLoading;
      _error = $v.error;
      _hasReachedMax = $v.hasReachedMax;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HomeState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HomeState;
  }

  @override
  void update(void Function(HomeStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HomeState build() => _build();

  _$HomeState _build() {
    _$HomeState _$result;
    try {
      _$result = _$v ??
          new _$HomeState._(
              page: BuiltValueNullFieldError.checkNotNull(
                  page, r'HomeState', 'page'),
              term: BuiltValueNullFieldError.checkNotNull(
                  term, r'HomeState', 'term'),
              items: items.build(),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'HomeState', 'isLoading'),
              error: error,
              hasReachedMax: BuiltValueNullFieldError.checkNotNull(
                  hasReachedMax, r'HomeState', 'hasReachedMax'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'HomeState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
