import 'dart:convert';
import 'dart:io';

import 'package:flutter_github_search_rx_redux/data/remote/search_remote_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:test/test.dart' show TypeMatcher;
import 'data.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group('SearchRemoteSourceImpl', () {
    const baseUrl = 'github.com';

    Uri getUri(String unencodedPath, {Map<String, String> queryParameters}) =>
        Uri.https(
          baseUrl,
          unencodedPath,
          queryParameters,
        );

    SearchRemoteSourceImpl remoteSource;
    MockClient client;

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
      when(client.get(uri)).thenAnswer((_) async {
        final body = jsonEncode(searchResult);
        return http.Response(body, 200);
      });

      final result = await remoteSource.search(term, page);
      verify(client.get(uri)).called(1);
      expect(result, searchResult);
    });

    test('Search failed with status code is not 200', () async {
      const term = 'rxdart';
      const page = 1;

      final uri = getUri(
        'search/repositories',
        queryParameters: {'q': term, 'page': page.toString()},
      );
      when(client.get(uri)).thenAnswer((_) async {
        final body = jsonEncode({
          'message': 'Something was wrong',
          'status': 500,
        });
        return http.Response(body, 500);
      });

      Object error;
      try {
        await remoteSource.search(term, page);
      } catch (e) {
        error = e;
      }

      verify(client.get(uri)).called(1);
      expect(error, isNotNull);
      expect(error, const TypeMatcher<HttpException>());
    });

    test('Search failed without response', () async {
      const term = 'rxdart';
      const page = 1;
      const errorMessage = 'This is socket exception!';

      final uri = getUri(
        'search/repositories',
        queryParameters: {'q': term, 'page': page.toString()},
      );
      when(client.get(uri)).thenAnswer((_) async {
        throw SocketException(errorMessage);
      });

      Object error;
      try {
        await remoteSource.search(term, page);
      } catch (e) {
        error = e;
      }

      verify(client.get(uri)).called(1);
      expect(error, isNotNull);
      expect(
        error,
        const TypeMatcher<SocketException>().having(
          (e) => e.message,
          'SocketException.message',
          errorMessage,
        ),
      );
    });
  });
}
