import 'search_result.dart';

abstract class SearchRemoteSource {
  Future<SearchResult> search(String term, int page);
}
