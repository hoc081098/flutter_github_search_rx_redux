import 'package:dart_either/dart_either.dart';
import 'package:flutter_github_search_rx_redux/data/remote/mapper.dart';
import 'package:flutter_github_search_rx_redux/data/search_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart_ext/single.dart';

import '../mocks.mocks.dart';
import '../utils.dart';
import 'remote/data.dart';

void main() {
  group('SearchRepositoryImpl', () {
    late SearchRepositoryImpl repo;
    late MockSearchRemoteSource searchSource;
    late MockColorRemoteSource colorSource;

    setUpAll(() {
      searchSource = MockSearchRemoteSource();
      colorSource = MockColorRemoteSource();
      repo = SearchRepositoryImpl(
        searchSource,
        searchResultToRepoItems,
        colorSource,
      );
    });

    test('search successful', () async {
      when(searchSource.search('term', 1))
          .thenAnswer((_) => Single.value(searchResult));
      when(colorSource.getColors()).thenAnswer((_) => Single.value(colors));

      await expectSingle(
        repo.searchBy(term: 'term', page: 1),
        repoItems.right(),
      );
      verify(searchSource.search('term', 1)).called(1);
      verify(colorSource.getColors()).called(1);
    });

    test('search failed', () async {
      {
        when(searchSource.search('term', 1))
            .thenAnswer((_) => Single.error(Exception()));
        when(colorSource.getColors()).thenAnswer((_) => Single.value(colors));

        await expectSingle(
            repo.searchBy(term: 'term', page: 1), isException.left());
        verify(searchSource.search('term', 1)).called(1);
        verify(colorSource.getColors()).called(1);
      }

      {
        when(searchSource.search('term', 1))
            .thenAnswer((_) => Single.value(searchResult));
        when(colorSource.getColors())
            .thenAnswer((_) => Single.error(Exception()));

        await expectSingle(
            repo.searchBy(term: 'term', page: 1), isException.left());
        verify(searchSource.search('term', 1)).called(1);
        verify(colorSource.getColors()).called(1);
      }
    });
  });
}
