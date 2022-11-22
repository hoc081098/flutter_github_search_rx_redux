import 'package:flutter_github_search_rx_redux/data/remote/search_result.dart';
import 'package:http_client_hoc081098/http_client_hoc081098.dart';
import 'package:rxdart_ext/rxdart_ext.dart';

import 'search_remote_source.dart';

class SearchRemoteSourceImpl implements SearchRemoteSource {
  final SimpleHttpClient _client;
  final String _baseUrl;

  SearchRemoteSourceImpl(this._client, this._baseUrl);

  @override
  Single<SearchResult> search(String term, int page) =>
      useCancellationToken((cancelToken) async {
        final url = Uri.https(
          _baseUrl,
          'search/repositories',
          {'q': term, 'page': page.toString()},
        );
        print('SearchRemoteSourceImpl: ${url.queryParameters}');

        final json = await _client.getJson(url, cancelToken: cancelToken)
            as Map<String, dynamic>;

        return SearchResult.fromJson(json);
      });
}
