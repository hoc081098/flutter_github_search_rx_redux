import 'dart:io';

import 'package:cupertino_http/cupertino_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_search_rx_redux/data/remote/color_remote_source_impl.dart';
import 'package:flutter_github_search_rx_redux/data/remote/search_remote_source_impl.dart';
import 'package:flutter_github_search_rx_redux/data/search_repo_impl.dart';
import 'package:flutter_github_search_rx_redux/domain/search_repo.dart';
import 'package:flutter_github_search_rx_redux/domain/search_usecase.dart';
import 'package:flutter_provider/flutter_provider.dart';
import 'package:http/http.dart' as http;
import 'package:http_client_hoc081098/http_client_hoc081098.dart';

import 'data/remote/mapper.dart';
import 'ui/home/home_page.dart';

void main() {
  final loggingInterceptor = SimpleLoggingInterceptor(
    SimpleLogger(
      loggerFunction: print,
      level: kReleaseMode ? SimpleLogLevel.none : SimpleLogLevel.body,
    ),
  );

  final client = SimpleHttpClient(
    client: Platform.isIOS || Platform.isMacOS
        ? CupertinoClient.defaultSessionConfiguration()
        : http.Client(),
    timeout: const Duration(seconds: 20),
    requestInterceptors: [
      // others interceptors above this line
      loggingInterceptor.requestInterceptor,
    ],
    responseInterceptors: [
      loggingInterceptor.responseInterceptor,
      // others interceptors below this line
    ],
  );

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
    Provider<SearchRepository>.value(
      searchRepo,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  static final themeData = () {
    final themeData = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.pink,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
    return themeData.copyWith(
      colorScheme: themeData.colorScheme.copyWith(
        secondary: Colors.purpleAccent,
      ),
    );
  }();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github repo search',
      theme: themeData,
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Github repo search'),
            ),
            body: Container(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Provider<SearchUseCase>.factory(
                          (context) => SearchUseCase(context.get()),
                          child: const MyHomePage(),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: Text('Start'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
