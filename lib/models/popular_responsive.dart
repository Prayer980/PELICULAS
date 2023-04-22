// To parse this JSON data, do
//
//     final popularResponsive = popularResponsiveFromMap(jsonString);

import 'dart:convert';

import 'package:peliculas/models/models.dart';

class PopularResponsive {
  PopularResponsive({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory PopularResponsive.fromJson(String str) =>
      PopularResponsive.fromMap(json.decode(str));

  factory PopularResponsive.fromMap(Map<String, dynamic> json) =>
      PopularResponsive(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
