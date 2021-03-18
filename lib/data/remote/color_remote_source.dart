import 'dart:ui';

import 'package:built_collection/built_collection.dart';

abstract class ColorRemoteSource {
  Future<BuiltMap<String, Color>> getColors();
}
