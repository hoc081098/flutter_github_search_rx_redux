import 'package:flutter/material.dart';
import 'package:flutter_github_search_rx_redux/data/remote/color_remote_source_impl.dart';
import 'package:flutter_github_search_rx_redux/data/remote/search_remote_source_impl.dart';
import 'package:flutter_github_search_rx_redux/data/search_repo_impl.dart';
import 'package:flutter_github_search_rx_redux/domain/search_repo.dart';
import 'package:flutter_github_search_rx_redux/domain/search_usecase.dart';
import 'package:flutter_provider/flutter_provider.dart';
import 'package:http/http.dart' as http;

import 'data/remote/mapper.dart';
import 'ui/home/home_page.dart';

void main() {
  final client = http.Client();
  const searchBaseUrl = 'api.github.com';
  final colorUrl =
      Uri.parse('https://github.com/ozh/github-colors/raw/master/colors.json');

  final searchRemoteSource = SearchRemoteSourceImpl(client, searchBaseUrl);
  final colorRemoteSource = ColorRemoteSourceImpl(client, colorUrl);
  final searchRepo = SearchRepositoryImpl(
    searchRemoteSource,
    searchResultToRepoItems,
    colorRemoteSource,
  );
  runApp(
    Provider<SearchRepository>(
      child: MyApp(),
      value: searchRepo,
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github repo search',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.pink,
        accentColor: Colors.purpleAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Provider<SearchUseCase>(
        child: const MyHomePage(),
        value: SearchUseCase(Provider.of<SearchRepository>(context)),
      ),
    );
  }
}
