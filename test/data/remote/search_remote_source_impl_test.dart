import 'dart:convert';
import 'dart:io';

import 'package:dart_either/dart_either.dart';
import 'package:flutter_github_search_rx_redux/data/remote/search_remote_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http_client_hoc081098/http_client_hoc081098.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';
import '../../utils.dart';
import 'data.dart';

void main() {
  group('SearchRemoteSourceImpl', () {
    const baseUrl = 'github.com';

    Uri getUri(String unencodedPath, {Map<String, String>? queryParameters}) =>
        Uri.https(
          baseUrl,
          unencodedPath,
          queryParameters,
        );

    late SearchRemoteSourceImpl remoteSource;
    late MockClient client;

    setUpAll(() {
      client = MockClient();
      remoteSource = SearchRemoteSourceImpl(client, baseUrl);
    });

    test('Search successful', () async {
      const term = 'rxdart';
      const page = 1;

      final uri = getUri(
        'search/repositories',
        queryParameters: {'q': term, 'page': page.toString()},
      );
      when(client.getJson(uri, cancelToken: anyNamed('cancelToken')))
          .thenAnswer((_) async => searchResult.toJson());

      await expectSingle(remoteSource.search(term, page), searchResult.right());
      verify(client.getJson(uri, cancelToken: anyNamed('cancelToken')))
          .called(1);
    });

    test('Search failed with status code is not 200', () async {
      const term = 'rxdart';
      const page = 1;

      final uri = getUri(
        'search/repositories',
        queryParameters: {'q': term, 'page': page.toString()},
      );
      when(client.getJson(uri, cancelToken: anyNamed('cancelToken')))
          .thenAnswer((_) async {
        final body = jsonEncode({
          'message': 'Something was wrong',
          'status': 500,
        });
        throw SimpleErrorResponseException(http.Response(body, 500));
      });

      await expectSingle(
        remoteSource.search(term, page),
        isA<SimpleErrorResponseException>().left(),
      );
      verify(client.getJson(uri, cancelToken: anyNamed('cancelToken')))
          .called(1);
    });

    test('Search failed without response', () async {
      const term = 'rxdart';
      const page = 1;
      const errorMessage = 'This is socket exception!';

      final uri = getUri(
        'search/repositories',
        queryParameters: {'q': term, 'page': page.toString()},
      );
      when(client.getJson(uri, cancelToken: anyNamed('cancelToken')))
          .thenAnswer((_) async {
        throw SocketException(errorMessage);
      });

      await expectSingle(
        remoteSource.search(term, page),
        isA<SocketException>()
            .having(
              (e) => e.message,
              'SocketException.message',
              errorMessage,
            )
            .left(),
      );
      verify(client.getJson(uri, cancelToken: anyNamed('cancelToken')))
          .called(1);
    });
  });
}
