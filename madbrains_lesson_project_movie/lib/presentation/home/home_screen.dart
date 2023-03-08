import 'package:flutter/material.dart';
import 'package:madbrains_lesson_project_movie/app/widgets/film_tile.dart';
import 'package:madbrains_lesson_project_movie/data/repositories/moview_repository.dart';
import 'package:madbrains_lesson_project_movie/domain/models/movie_card_model.dart';

class HomeScreenNetwork extends StatefulWidget {
  const HomeScreenNetwork({super.key});

  @override
  State<HomeScreenNetwork> createState() => _HomeScreenNetworkState();
}

class _HomeScreenNetworkState extends State<HomeScreenNetwork> {
  Future<HomeModel?>? dataLoadingState;

  @override
  void didChangeDependencies() {
    dataLoadingState ??= MoviesRepository.loadData(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            FutureBuilder(
              future: dataLoadingState,
              builder: (context, data) {
                return data.connectionState != ConnectionState.done
                    ? const Center(child: CircularProgressIndicator())
                    : data.hasData
                        ? data.data?.results?.isNotEmpty == true
                            ? Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return FilmTile.fromModel(
                                        model: data.data?.results![index]);
                                  },
                                  itemCount: data.data?.results?.length ?? 0,
                                ),
                              )
                            : const SizedBox.shrink()
                        : const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
