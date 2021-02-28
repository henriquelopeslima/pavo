import 'package:pavo/app/models/movie_model.dart';

abstract class IMovieRepository {
  Future<List<MovieModel>> getMovies({int page});
}
