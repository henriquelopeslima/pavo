import 'package:pavo/app/models/movie_model.dart';

abstract class IMovieService {
  Future<List<MovieModel>> getMovies();
}
