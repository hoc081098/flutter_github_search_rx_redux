// Mocks generated by Mockito 5.0.3 from annotations
// in flutter_github_search_rx_redux/test/mocks.dart.
// Do not manually edit this file.

import 'dart:async' as _i8;
import 'dart:convert' as _i9;
import 'dart:typed_data' as _i3;
import 'dart:ui' as _i13;

import 'package:built_collection/src/map.dart' as _i6;
import 'package:flutter_github_search_rx_redux/data/remote/color_remote_source.dart'
    as _i12;
import 'package:flutter_github_search_rx_redux/data/remote/search_remote_source.dart'
    as _i11;
import 'package:flutter_github_search_rx_redux/data/remote/search_result.dart'
    as _i5;
import 'package:http/src/base_request.dart' as _i10;
import 'package:http/src/client.dart' as _i7;
import 'package:http/src/response.dart' as _i2;
import 'package:http/src/streamed_response.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakeResponse extends _i1.Fake implements _i2.Response {}

class _FakeUint8List extends _i1.Fake implements _i3.Uint8List {}

class _FakeStreamedResponse extends _i1.Fake implements _i4.StreamedResponse {}

class _FakeSearchResult extends _i1.Fake implements _i5.SearchResult {}

class _FakeBuiltMap<K, V> extends _i1.Fake implements _i6.BuiltMap<K, V> {}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i7.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future.value(_FakeResponse()))
          as _i8.Future<_i2.Response>);
  @override
  _i8.Future<_i2.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future.value(_FakeResponse()))
          as _i8.Future<_i2.Response>);
  @override
  _i8.Future<_i2.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i9.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future.value(_FakeResponse()))
          as _i8.Future<_i2.Response>);
  @override
  _i8.Future<_i2.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i9.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future.value(_FakeResponse()))
          as _i8.Future<_i2.Response>);
  @override
  _i8.Future<_i2.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i9.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future.value(_FakeResponse()))
          as _i8.Future<_i2.Response>);
  @override
  _i8.Future<_i2.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i9.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future.value(_FakeResponse()))
          as _i8.Future<_i2.Response>);
  @override
  _i8.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future.value('')) as _i8.Future<String>);
  @override
  _i8.Future<_i3.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future.value(_FakeUint8List()))
          as _i8.Future<_i3.Uint8List>);
  @override
  _i8.Future<_i4.StreamedResponse> send(_i10.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue: Future.value(_FakeStreamedResponse()))
          as _i8.Future<_i4.StreamedResponse>);
}

/// A class which mocks [SearchRemoteSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchRemoteSource extends _i1.Mock
    implements _i11.SearchRemoteSource {
  MockSearchRemoteSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i5.SearchResult> search(String? term, int? page) =>
      (super.noSuchMethod(Invocation.method(#search, [term, page]),
              returnValue: Future.value(_FakeSearchResult()))
          as _i8.Future<_i5.SearchResult>);
}

/// A class which mocks [ColorRemoteSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockColorRemoteSource extends _i1.Mock implements _i12.ColorRemoteSource {
  MockColorRemoteSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i6.BuiltMap<String, _i13.Color>> getColors() =>
      (super.noSuchMethod(Invocation.method(#getColors, []),
              returnValue: Future.value(_FakeBuiltMap<String, _i13.Color>()))
          as _i8.Future<_i6.BuiltMap<String, _i13.Color>>);
}
