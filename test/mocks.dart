import 'package:flutter_github_search_rx_redux/data/remote/color_remote_source.dart';
import 'package:flutter_github_search_rx_redux/data/remote/search_remote_source.dart';
import 'package:http_client_hoc081098/http_client_hoc081098.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<SimpleHttpClient>(as: #MockClient),
    MockSpec<SearchRemoteSource>(as: #MockSearchRemoteSource),
    MockSpec<ColorRemoteSource>(as: #MockColorRemoteSource),
  ],
)
// ignore: unused_element
void _genMocks() {}
