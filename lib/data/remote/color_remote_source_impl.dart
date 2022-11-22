import 'dart:ui';

import 'package:built_collection/built_collection.dart';
import 'package:http_client_hoc081098/http_client_hoc081098.dart';
import 'package:meta/meta.dart';
import 'package:rxdart_ext/rxdart_ext.dart';

import 'color_remote_source.dart';

class ColorRemoteSourceImpl implements ColorRemoteSource {
  final SimpleHttpClient _client;
  final Uri _url;

  BuiltMap<String, Color>? _cachedColors;

  ColorRemoteSourceImpl(this._client, this._url);

  @override
  Single<BuiltMap<String, Color>> getColors() {
    return Single.defer(() {
      if (_cachedColors != null) {
        return Single.value(_cachedColors!);
      }

      return useCancellationToken((cancelToken) async {
        final json = await _client.getJson(_url, cancelToken: cancelToken)
            as Map<String, dynamic>;

        return _cachedColors = _toColorMap(json);
      });
    });
  }

  static BuiltMap<String, Color> _toColorMap(Map<String, dynamic> json) =>
      (json.map((key, value) {
        final color = value['color'];
        return MapEntry(
          key,
          color is String ? colorFromHex(color) : null,
        );
      })
            ..removeWhere((key, value) => value == null))
          .cast<String, Color>()
          .build();

  @visibleForTesting
  static Color colorFromHex(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF' + hex;
    }
    return Color(int.parse(hex, radix: 16));
  }
}
