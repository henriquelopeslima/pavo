import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pavo/app/components/error_box_component.dart';
import 'package:pavo/app/components/movie_box_component.dart';
import 'package:pavo/app/controllers/movie_controller.dart';
import 'package:pavo/app/services/movie_service.dart';

class HomePage extends StatelessWidget {
  final MovieController movieStore =
      MovieController(movieService: movieService);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Observer(
          builder: (_) {
            if (movieStore.moveis.isEmpty && movieStore.errorMenssage == "") {
              return Center(child: CircularProgressIndicator());
            } else if (movieStore.errorMenssage != "") {
              return Container(
                child: ErrorBox(
                  message: movieStore.errorMenssage,
                  function: movieStore.getMovies,
                ),
              );
            } else {
              return GridView.extent(
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
    );
  }
}
