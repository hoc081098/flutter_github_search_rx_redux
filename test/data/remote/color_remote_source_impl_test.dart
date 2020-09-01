import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter_github_search_rx_redux/data/remote/color_remote_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:test/test.dart' show TypeMatcher;

import 'data.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group('ColorRemoteSourceImpl', () {
    final url = Uri.parse('https://github.com/hoc081098');

    ColorRemoteSourceImpl colorSource;
    MockClient client;

    setUp(() {
      client = MockClient();
      colorSource = ColorRemoteSourceImpl(client, url);
    });

    tearDown(() => client.close());

    test('Get successful', () async {
      when(client.get(url))
          .thenAnswer((_) async => http.Response(jsonEncode(colorsRaw), 200));

      final result = await colorSource.getColors();
      verify(client.get(url)).called(1);
      expect(result, colors);
    });

    test('Get from cached instead of making request', () async {
      when(client.get(url))
          .thenAnswer((_) async => http.Response(jsonEncode(colorsRaw), 200));

      expect(await colorSource.getColors(), colors);
      verify(client.get(url)).called(1);

      expect(await colorSource.getColors(), colors);
      verifyNever(client.get(url));

      expect(await colorSource.getColors(), colors);
      verifyNever(client.get(url));
    });

    test('Get failed with status code is not 200', () async {
      when(client.get(url)).thenAnswer((_) async {
        final body = jsonEncode({
          'message': 'Something was wrong',
          'status': 500,
        });
        return http.Response(body, 500);
      });

      Object error;
      try {
        await colorSource.getColors();
      } catch (e) {
        error = e;
      }

      verify(client.get(url)).called(1);
      expect(error, isNotNull);
      expect(error, const TypeMatcher<HttpException>());
    });

    test('Get failed without response', () async {
      const errorMessage = 'This is socket exception!';

      when(client.get(url))
          .thenAnswer((_) async => throw SocketException(errorMessage));

      Object error;
      try {
        await colorSource.getColors();
      } catch (e) {
        error = e;
      }

      verify(client.get(url)).called(1);
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

    test('colorFromHex', () {
      expect(
        ColorRemoteSourceImpl.colorFromHex('#FF112233'),
        Color(0xFF112233),
      );

      expect(
        ColorRemoteSourceImpl.colorFromHex('#112233'),
        Color(0xFF112233),
      );

      expect(
        ColorRemoteSourceImpl.colorFromHex('112233'),
        Color(0xFF112233),
      );
    });
  });
}
