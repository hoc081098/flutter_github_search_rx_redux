import 'package:dart_either/dart_either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart_ext/rxdart_ext.dart';

Future<void> expectSingle<T>(
        Single<T> single, Either<Object, Object> expected) =>
    expectLater(
      single,
      emitsInOrder(<Object>[
        expected.fold(ifLeft: emitsError, ifRight: emits),
        emitsDone,
      ]),
    );
