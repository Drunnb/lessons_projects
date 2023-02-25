// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:madbrains_lesson_project_movie/ui/theme/app_colors.dart';

class HomePageFromLesson extends StatefulWidget {
  const HomePageFromLesson({super.key});

  @override
  State<HomePageFromLesson> createState() => _HomePageFromLessonState();
}

class _HomePageFromLessonState extends State<HomePageFromLesson> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movies'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.sort),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            )
          ],
        ),
        body: const _FilmList(),
      ),
    );
  }
}

class _FilmList extends StatelessWidget {
  const _FilmList();

  static final List<String> films = <String>[
    'Брат',
    'Служебный роман',
    'Волк с Уолл-Стрит',
    'Бриллиантовая рука',
    'Интерстеллар',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        films.length,
        (index) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: ColoredBox(
            color: AppColors.mainPurpleColor,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: FilmTile(title: films[index]),
            ),
          ),
        ),
      ),
    );
  }
}

class FilmTile extends StatelessWidget {
  final String title;
  const FilmTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: FlutterLogo()),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Text(title),
              Row(
                children: const [
                  Icon(Icons.star),
                  Text('4.5'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
