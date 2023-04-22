import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = 'cc7fc7c0bbd111ecf5ce7f06e835db06';
  String _baseUrl = 'api.themoviedb.org';
  String _languaje = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    print('movies provider Inicializado');

    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(
      _baseUrl,
      '/3/movie/now_playing',
      {
        'api_key': _apiKey,
        'language': _languaje,
        'page': '1',
      },
    );

    // Await the http get response, then decode the json-formatted response.

    final response = await http.get(url);
    final nowPlayingResponsive = NowPlayingResponsive.fromJson(response.body);

    onDisplayMovies = nowPlayingResponsive.results;

    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(
      _baseUrl,
      '/3/movie/popular',
      {
        'api_key': _apiKey,
        'language': _languaje,
        'page': '1',
      },
    );

    // Await the http get response, then decode the json-formatted response.

    final response = await http.get(url);
    final popularResponsive = PopularResponsive.fromJson(response.body);

    popularMovies = [...popularMovies, ...popularResponsive.results];
  }
}
