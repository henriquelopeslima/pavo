// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieController on _MovieControllerBase, Store {
  final _$moveisAtom = Atom(name: '_MovieControllerBase.moveis');

  @override
  List<MovieModel> get moveis {
    _$moveisAtom.reportRead();
    return super.moveis;
  }

  @override
  set moveis(List<MovieModel> value) {
    _$moveisAtom.reportWrite(value, super.moveis, () {
      super.moveis = value;
    });
  }

  final _$errorMenssageAtom = Atom(name: '_MovieControllerBase.errorMenssage');

  @override
  String get errorMenssage {
    _$errorMenssageAtom.reportRead();
    return super.errorMenssage;
  }

  @override
  set errorMenssage(String value) {
    _$errorMenssageAtom.reportWrite(value, super.errorMenssage, () {
      super.errorMenssage = value;
    });
  }

  final _$getMoviesAsyncAction = AsyncAction('_MovieControllerBase.getMovies');

  @override
  Future getMovies() {
    return _$getMoviesAsyncAction.run(() => super.getMovies());
  }

  @override
  String toString() {
    return '''
moveis: ${moveis},
errorMenssage: ${errorMenssage}
    ''';
  }
}
