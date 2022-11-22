import 'dart:ui';

import 'package:built_collection/built_collection.dart';
import 'package:rxdart_ext/single.dart';

abstract class ColorRemoteSource {
  Single<BuiltMap<String, Color>> getColors();
}
