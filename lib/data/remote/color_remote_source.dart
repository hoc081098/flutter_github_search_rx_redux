import 'dart:ui';

abstract class ColorRemoteSource {
  Future<Map<String, Color>> getColors();
}
