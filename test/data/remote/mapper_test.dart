import 'package:flutter_github_search_rx_redux/data/remote/mapper.dart';
import 'package:flutter_test/flutter_test.dart';

import 'data.dart';

void main() {
  test('searchResultToRepoItems', () {
    expect(
      searchResultToRepoItems(searchResult, colors),
      repoItems,
    );
  });
}
