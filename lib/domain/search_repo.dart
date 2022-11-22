import 'package:built_collection/built_collection.dart';
import 'package:rxdart_ext/single.dart';

import 'repo_item.dart';

abstract class SearchRepository {
  Single<BuiltList<RepoItem>> searchBy({
    required String term,
    required int page,
  });
}
