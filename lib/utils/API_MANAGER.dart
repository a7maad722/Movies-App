import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/movie_detalis.dart';
import '../models/new_release.dart';
import '../models/popular.dart';
import '../models/top_rated.dart';
class ApiManager {
  static Future<PopularMoviesModel> getPopular() async {
    Uri url = Uri.https(
      'api.themoviedb.org',
      '/3/movie/popular',
      {
        "api_key": "bf0eaa7605c293429c9e1fca785c7e1e",
      },
    );
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    PopularMoviesModel popularMoviesModel = PopularMoviesModel.fromJson(json);
    return popularMoviesModel;
  }

  static Future<NewReleaseMoviesModel> getNewRelease() async {
    Uri url = Uri.https('api.themoviedb.org', '/3/movie/upcoming', {
      "api_key": "bf0eaa7605c293429c9e1fca785c7e1e",
    });
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    NewReleaseMoviesModel newReleaseMoviesModel =
    NewReleaseMoviesModel.fromJson(json);
    return newReleaseMoviesModel;
  }

  static Future<TopRatedModel> getTopRated() async {
    Uri url = Uri.https('api.themoviedb.org', '/3/movie/top_rated', {
      "api_key": "bf0eaa7605c293429c9e1fca785c7e1e",
    });
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    TopRatedModel topRatedModel = TopRatedModel.fromJson(json);
    return topRatedModel;
  }

  static Future<MovieDetailsModel> getMovieDetails(String id) async {
    Uri url = Uri.https('api.themoviedb.org', '/3/movie/$id', {
      "api_key": "bf0eaa7605c293429c9e1fca785c7e1e",
    });

    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    return MovieDetailsModel.fromJson(json);
  }
}
