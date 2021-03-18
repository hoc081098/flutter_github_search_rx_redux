import 'dart:io';

import 'package:flutter_github_search_rx_redux/data/remote/search_result.dart';
import 'package:http/http.dart' as http;

import 'search_remote_source.dart';

class SearchRemoteSourceImpl implements SearchRemoteSource {
  final http.Client _client;
  final String _baseUrl;

  SearchRemoteSourceImpl(this._client, this._baseUrl);

  @override
  Future<SearchResult> search(String term, int page) async {
    final url = Uri.https(
      _baseUrl,
      'search/repositories',
      {'q': term, 'page': page.toString()},
    );
    print('SearchRemoteSourceImpl: ${url.queryParameters}');
    final response = await _client.get(url);

    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(
        'Search for term: $term and page: $page failed with status code: ${response.statusCode}, response body: ${response.body}',
        uri: url,
      );
    }

    return SearchResult.fromRawJson(response.body);
  }
}
