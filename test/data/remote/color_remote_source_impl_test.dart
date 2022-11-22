import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:dart_either/dart_either.dart';
import 'package:flutter_github_search_rx_redux/data/remote/color_remote_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http_client_hoc081098/http_client_hoc081098.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';
import '../../utils.dart';
import 'data.dart';

void main() {
  group('ColorRemoteSourceImpl', () {
    final url = Uri.parse('https://github.com/hoc081098');

    late ColorRemoteSourceImpl colorSource;
    late MockClient client;

    setUp(() {
      client = MockClient();
      colorSource = ColorRemoteSourceImpl(client, url);
    });

    test('Get successful', () async {
      when(client.getJson(url, cancelToken: anyNamed('cancelToken')))
          .thenAnswer((_) async => colorsRaw);

      await expectSingle(colorSource.getColors(), colors.right());
      verify(client.getJson(url, cancelToken: anyNamed('cancelToken')))
          .called(1);
    });

    test('Get from cached instead of making request', () async {
      when(client.getJson(url, cancelToken: anyNamed('cancelToken')))
          .thenAnswer((_) async => colorsRaw);

      await expectSingle(colorSource.getColors(), colors.right());
      verify(client.getJson(url, cancelToken: anyNamed('cancelToken')))
          .called(1);

      await expectSingle(colorSource.getColors(), colors.right());
      verifyNever(client.getJson(url, cancelToken: anyNamed('cancelToken')));

      await expectSingle(colorSource.getColors(), colors.right());
      verifyNever(client.getJson(url, cancelToken: anyNamed('cancelToken')));
    });

    test('Get failed with status code is not 200', () async {
      when(client.getJson(url, cancelToken: anyNamed('cancelToken')))
          .thenAnswer((_) async {
        final body = jsonEncode({
          'message': 'Something was wrong',
          'status': 500,
        });
        throw SimpleErrorResponseException(http.Response(body, 500));
      });

      await expectSingle(
        colorSource.getColors(),
        isA<SimpleErrorResponseException>().left(),
      );
      verify(client.getJson(url, cancelToken: anyNamed('cancelToken')))
          .called(1);
    });

    test('Get failed without response', () async {
      const errorMessage = 'This is socket exception!';

      when(client.getJson(url, cancelToken: anyNamed('cancelToken')))
          .thenAnswer((_) async => throw SocketException(errorMessage));

      await expectSingle(
        colorSource.getColors(),
        isA<SocketException>()
            .having(
              (e) => e.message,
              'SocketException.message',
              errorMessage,
            )
            .left(),
      );

      verify(client.getJson(url, cancelToken: anyNamed('cancelToken')))
          .called(1);
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
