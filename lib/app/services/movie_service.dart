import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pavo/app/models/movie_model.dart';
import 'package:pavo/app/repositories/interfaces/movie_repository_interface.dart';
import 'package:pavo/app/repositories/movie_repository.dart';
import 'package:pavo/app/utils/environment_config.dart';

import 'interfaces/movie_service_interface.dart';

final movieRepository = MovieRepository(environmentConfig, Dio());
final movieService = MovieService(movieRepository: movieRepository);

class MovieService implements IMovieService {
  final IMovieRepository movieRepository;

  MovieService({@required this.movieRepository});

  @override
  Future<List<MovieModel>> getMovies() {
    return movieRepository.getMovies();
  }
}
