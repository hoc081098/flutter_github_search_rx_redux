import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'color_remote_source.dart';

class ColorRemoteSourceImpl implements ColorRemoteSource {
  final http.Client _client;
  final Uri _url;

  Map<String, Color> _cachedColors;

  ColorRemoteSourceImpl(this._client, this._url);

  @override
  Future<Map<String, Color>> getColors() async {
    if (_cachedColors != null) {
      return _cachedColors;
    }

    final response = await _client.get(_url);

    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(
        'Get colors failed failed with status code: ${response.statusCode}',
        uri: _url,
      );
    }

    return _cachedColors = (jsonDecode(response.body) as Map).map((key, value) {
      final color = value['color'];
      return MapEntry(
        key,
        color != null ? colorFromHex(color) : color,
      );
    });
  }

  @visibleForTesting
  static Color colorFromHex(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF' + hex;
    }
    return Color(int.parse(hex, radix: 16));
  }
}
