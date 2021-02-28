import 'package:mobx/mobx.dart';
import 'package:pavo/app/services/interfaces/movie_service_interface.dart';
import 'package:pavo/app/utils/movie_exception.dart';

import '../../models/movie_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IMovieService movieService;

  @observable
  List<MovieModel> moveis = [];

  @observable
  String errorMenssage = "";

  @observable
  int page = 1;

  _HomeControllerBase({this.movieService}) {
    getMovies();
  }

  @action
  getMovies() async {
    try {
      moveis += await movieService.getMovies(page: page);
      errorMenssage = "";
    } on MoviesException catch (e) {
      moveis = [];
      errorMenssage = e.toString();
    }
  }

  loadingMovies() {
    this.page += 1;
    this.getMovies();
  }
}
