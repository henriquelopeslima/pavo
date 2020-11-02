import 'package:mobx/mobx.dart';
import 'package:pavo/app/services/interfaces/movie_service_interface.dart';
import 'package:pavo/app/utils/movie_exception.dart';

import '../models/movie_model.dart';

part 'movie_controller.g.dart';

class MovieController = _MovieControllerBase with _$MovieController;

abstract class _MovieControllerBase with Store {
  final IMovieService movieService;

  @observable
  List<MovieModel> moveis = [];

  @observable
  String errorMenssage = "";

  _MovieControllerBase({this.movieService}) {
    getMovies();
  }

  @action
  getMovies() async {
    try {
      moveis = await movieService.getMovies();
      errorMenssage = "";
    } on MoviesException catch (e) {
      moveis = [];
      errorMenssage = e.toString();
    }
  }
}
