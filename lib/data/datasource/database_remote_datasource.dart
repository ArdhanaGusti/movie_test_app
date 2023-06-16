import 'dart:convert';

import 'package:movie_test_app/data/model/actor_model.dart';
import 'package:movie_test_app/data/model/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_test_app/data/model/tv_series_model.dart';
import 'package:movie_test_app/utils/exception.dart';

abstract class DatabaseRemoteDataSource {
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
  Future<List<Movie>> getUpcomingMovies();
  Future<MovieDetail> getMovieDetail(String id);
  Future<List<Series>> getPopularSeries();
  Future<List<Series>> getOnTheAirSeries();
  Future<List<Series>> getTopRatedSeries();
  Future<List<Series>> getAiringTodaySeries();
  Future<SeriesDetail> getSeriesDetail(String id);
  Future<List<Actor>> getPopularActor();
  Future<ActorDetail> getActorDetail(String id);
  Future<List<Movie>> getSearchMovies(String query);
  Future<List<Series>> getSearchSeries(String query);
}

class DatabaseRemoteDataSourceImpl implements DatabaseRemoteDataSource {
  static const apiKey = 'api_key=111327ac4f3e8f92636057d9ef51f953';

  static const baseUrl = 'https://api.themoviedb.org/3';

  final http.Client client;

  DatabaseRemoteDataSourceImpl({required this.client});

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    final response =
        await client.get(Uri.parse('$baseUrl/movie/now_playing?$apiKey'));

    if (response.statusCode == 200) {
      return MovieModel.fromJson(json.decode(response.body)).movie;
    } else {
      throw ServerException("Server Error");
    }
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    final response =
        await client.get(Uri.parse('$baseUrl/movie/popular?$apiKey'));

    if (response.statusCode == 200) {
      return MovieModel.fromJson(json.decode(response.body)).movie;
    } else {
      throw ServerException("Server Error");
    }
  }

  @override
  Future<List<Movie>> getTopRatedMovies() async {
    final response =
        await client.get(Uri.parse('$baseUrl/movie/top_rated?$apiKey'));

    if (response.statusCode == 200) {
      return MovieModel.fromJson(json.decode(response.body)).movie;
    } else {
      throw ServerException("Server Error");
    }
  }

  @override
  Future<List<Movie>> getUpcomingMovies() async {
    final response =
        await client.get(Uri.parse('$baseUrl/movie/upcoming?$apiKey'));

    if (response.statusCode == 200) {
      return MovieModel.fromJson(json.decode(response.body)).movie;
    } else {
      throw ServerException("Server Error");
    }
  }

  @override
  Future<List<Series>> getAiringTodaySeries() async {
    final response =
        await client.get(Uri.parse('$baseUrl/tv/airing_today?$apiKey'));

    if (response.statusCode == 200) {
      return SeriesModel.fromJson(json.decode(response.body)).movie;
    } else {
      throw ServerException("Server Error");
    }
  }

  @override
  Future<List<Series>> getOnTheAirSeries() async {
    final response =
        await client.get(Uri.parse('$baseUrl/tv/on_the_air?$apiKey'));

    if (response.statusCode == 200) {
      return SeriesModel.fromJson(json.decode(response.body)).movie;
    } else {
      throw ServerException("Server Error");
    }
  }

  @override
  Future<List<Series>> getPopularSeries() async {
    final response = await client.get(Uri.parse('$baseUrl/tv/popular?$apiKey'));

    if (response.statusCode == 200) {
      return SeriesModel.fromJson(json.decode(response.body)).movie;
    } else {
      throw ServerException("Server Error");
    }
  }

  @override
  Future<List<Series>> getTopRatedSeries() async {
    final response =
        await client.get(Uri.parse('$baseUrl/tv/top_rated?$apiKey'));

    if (response.statusCode == 200) {
      return SeriesModel.fromJson(json.decode(response.body)).movie;
    } else {
      throw ServerException("Server Error");
    }
  }

  @override
  Future<List<Actor>> getPopularActor() async {
    final response =
        await client.get(Uri.parse('$baseUrl/person/popular?$apiKey'));

    if (response.statusCode == 200) {
      return ActorModel.fromJson(json.decode(response.body)).actor;
    } else {
      throw ServerException("Server Error");
    }
  }

  @override
  Future<ActorDetail> getActorDetail(String id) async {
    final response = await client.get(Uri.parse('$baseUrl/person/$id?$apiKey'));

    if (response.statusCode == 200) {
      return ActorDetail.fromJson(json.decode(response.body));
    } else {
      throw ServerException("Server Error");
    }
  }

  @override
  Future<MovieDetail> getMovieDetail(String id) async {
    final response = await client.get(Uri.parse('$baseUrl/movie/$id?$apiKey'));

    if (response.statusCode == 200) {
      return MovieDetail.fromJson(json.decode(response.body));
    } else {
      throw ServerException("Server Error");
    }
  }

  @override
  Future<SeriesDetail> getSeriesDetail(String id) async {
    final response = await client.get(Uri.parse('$baseUrl/tv/$id?$apiKey'));

    if (response.statusCode == 200) {
      return SeriesDetail.fromJson(json.decode(response.body));
    } else {
      throw ServerException("Server Error");
    }
  }

  @override
  Future<List<Movie>> getSearchMovies(String query) async {
    final response = await client
        .get(Uri.parse('$baseUrl/search/movie?$apiKey&query=$query'));

    if (response.statusCode == 200) {
      return MovieModel.fromJson(json.decode(response.body)).movie;
    } else {
      throw ServerException("Server Error");
    }
  }

  @override
  Future<List<Series>> getSearchSeries(String query) async {
    final response =
        await client.get(Uri.parse('$baseUrl/search/tv?$apiKey&query=$query'));

    if (response.statusCode == 200) {
      return SeriesModel.fromJson(json.decode(response.body)).movie;
    } else {
      throw ServerException("Server Error");
    }
  }
}
