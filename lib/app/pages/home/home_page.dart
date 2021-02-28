import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pavo/app/app_controller.dart';
import 'package:pavo/app/components/error_box_component.dart';
import 'package:pavo/app/components/movie_box_component.dart';
import 'package:pavo/app/pages/home/home_controller.dart';
import 'package:pavo/app/services/movie_service.dart';

class HomePage extends StatelessWidget {
  final HomeController movieStore = HomeController(movieService: movieService);
  final ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController
      ..addListener(() {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          movieStore.loadingMovies();
        }
      });

    return Scaffold(
      appBar: AppBar(
        title: Text("Pavo"),
        centerTitle: true,
        actions: [
          Switch(
            value: AppController.instance.isDark,
            onChanged: (value) {
              AppController.instance.changeTheme(value);
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (_) {
                if (movieStore.moveis.isEmpty &&
                    movieStore.errorMenssage == "") {
                  return Center(child: CircularProgressIndicator());
                } else if (movieStore.errorMenssage != "") {
                  return Center(
                    child: Container(
                      alignment: Alignment.center,
                      child: ErrorBox(
                        message: movieStore.errorMenssage,
                        function: movieStore.getMovies,
                      ),
                    ),
                  );
                } else {
                  return GridView.extent(
                    controller: _scrollController,
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.7,
                    children: movieStore.moveis
                        .map((movie) => MovieBox(movie: movie))
                        .toList(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
