// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:madbrains_lesson_project_movie/entity_movie.dart';

import 'movie_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<Movie> myList;

  @override
  void initState() {
    myList = [
      Movie(
        '01',
        'Марсианин',
        'assets/images/poster1.jpg',
        8.9,
        'releaseDate',
        'Марсианская миссия «Арес-3» в процессе работы была вынуждена экстренно покинуть планету из-за надвигающейся песчаной бури. Инженер и биолог Марк Уотни получил повреждение скафандра во время песчаной бури. Сотрудники миссии, посчитав его погибшим. ',
        'ru',
      ),
      Movie(
        '02',
        'Marokko',
        'assets/images/poster2.jpg',
        6.0,
        'releaseDate',
        'Марокко, конец 20-х. Певица Эми Жолли приезжает выступать в местное варьете. Богач и донжуан Ла Бессье предлагает ей своё покровительство, а спустя некоторое время — руку и сердце. Но Эми уже успела влюбиться в легионера-американца Брауна',
        'de',
      ),
      Movie(
        '03',
        'Resident Evil',
        'assets/images/poster3',
        9.9,
        'releaseDate',
        'В гигантской подземной лаборатории выходит из-под контроля опаснейший вирус и мгновенно превращает своих жертв в прожорливых зомби. Достаточно одного их укуса или царапины, чтобы человек стал обезумевшим пожирателем живой плоти. Военные посылают в',
        'de',
      ),
      Movie(
        '04',
        'long way',
        'assets/images/poster4.jpg',
        5.9,
        'releaseDate',
        'Вооружившись удивительной способностью уменьшаться в размере, но обладать при этом большой силой, мошенник Скотт Лэнг должен стать героем и помочь своему наставнику доктору Хэнку Пиму сохранить в тайне существование костюма Человека-муравья от угроз нового поколения.',
        'en',
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/backgraund.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MovieWidget(
                    title: myList[0].title,
                    language: myList[0].languageType,
                    picture: myList[0].picture,
                    description: myList[0].description,
                  ),
                  MovieWidget(
                    title: myList[1].title,
                    language: myList[1].languageType,
                    picture: myList[1].picture,
                    description: myList[1].description,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
