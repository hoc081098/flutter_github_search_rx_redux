import 'package:rxdart_ext/single.dart';

import 'search_result.dart';

abstract class SearchRemoteSource {
  Single<SearchResult> search(String term, int page);
}
