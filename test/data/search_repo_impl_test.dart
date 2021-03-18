import 'package:flutter_github_search_rx_redux/data/remote/mapper.dart';
import 'package:flutter_github_search_rx_redux/data/search_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'remote/data.dart';
import '../mocks.mocks.dart';

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
          .thenAnswer((_) => Future.value(searchResult));
      when(colorSource.getColors()).thenAnswer((_) => Future.value(colors));

      final items = await repo.searchBy(term: 'term', page: 1);

      verify(searchSource.search('term', 1)).called(1);
      expect(items, repoItems);
    });

    test('search failed', () async {
      {
        when(searchSource.search('term', 1))
            .thenAnswer((_) => Future.error(Exception()));
        when(colorSource.getColors()).thenAnswer((_) => Future.value(colors));

        Object? error;
        try {
          await repo.searchBy(term: 'term', page: 1);
        } catch (e) {
          error = e;
        }

        expect(error, isNotNull);
        expect(error, isException);
        verify(searchSource.search('term', 1)).called(1);
      }

      {
        when(searchSource.search('term', 1))
            .thenAnswer((_) => Future.value(searchResult));
        when(colorSource.getColors())
            .thenAnswer((_) => Future.error(Exception()));

        Object? error;
        try {
          await repo.searchBy(term: 'term', page: 1);
        } catch (e) {
          error = e;
        }

        expect(error, isNotNull);
        expect(error, isException);
        verify(searchSource.search('term', 1)).called(1);
      }
    });
  });
}
