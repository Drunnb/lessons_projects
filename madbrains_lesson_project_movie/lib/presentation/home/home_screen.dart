import 'package:flutter/material.dart';
import 'package:madbrains_lesson_project_movie/app/widgets/film_tile.dart';
import 'package:madbrains_lesson_project_movie/components/delayed_action.dart';
import 'package:madbrains_lesson_project_movie/data/repositories/moview_repository.dart';
import 'package:madbrains_lesson_project_movie/domain/models/movie_card_model.dart';

class HomeScreenNetwork extends StatefulWidget {
  const HomeScreenNetwork({super.key});

  @override
  State<HomeScreenNetwork> createState() => _HomeScreenNetworkState();
}

class _HomeScreenNetworkState extends State<HomeScreenNetwork> {
  final TextEditingController textController = TextEditingController();
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
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: TextField(
                controller: textController,
                maxLines: 1,
                decoration: const InputDecoration(
                  labelText: 'Search',
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: _onSearchFieldTextChanged,
              ),
            ),
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

  void _onSearchFieldTextChanged(String text) {
    DelayedAction.run(() {
      dataLoadingState = MoviesRepository.loadData(
        context,
        text.isNotEmpty ? text : null,
      );
      setState(() {});
    });
  }
}
