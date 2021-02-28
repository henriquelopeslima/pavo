import 'package:dio/dio.dart';
import 'package:pavo/app/models/movie_model.dart';
import 'package:pavo/app/utils/environment_config.dart';

import '../utils/movie_exception.dart';
import 'interfaces/movie_repository_interface.dart';

final config = environmentConfig;

class MovieRepository implements IMovieRepository {
  MovieRepository(this._environmentConfig, this._dio);

  final EnvironmentConfig _environmentConfig;
  final Dio _dio;

  Future<List<MovieModel>> getMovies({int page}) async {
    try {
      final response = await _dio.get(
        "https://api.themoviedb.org/3/movie/popular?api_key=${_environmentConfig.movieApiKey}&language=pt-BR&page=$page",
      );

      final results = List<Map<String, dynamic>>.from(response.data['results']);

      List<MovieModel> movies = results
          .map((movieData) => MovieModel.fromMap(movieData))
          .toList(growable: true);
      return movies;
    } on DioError catch (dioError) {
      throw MoviesException.fromDioError(dioError);
    }
  }
}
