import 'package:flutter/material.dart';
import 'package:madbrains_lesson_project_movie/domain/models/film_card_model.dart';
import 'package:madbrains_lesson_project_movie/app/widgets/film_tile.dart';
import 'package:madbrains_lesson_project_movie/features/details/pages/details_from_list_movies.dart';

class FilmList extends StatelessWidget {
  const FilmList({super.key});

  static final List<FilmCardModel> films = <FilmCardModel>[
    FilmCardModel(
      id: 0,
      title: 'Брат',
      voteAverage: 8.3,
      picture:
          'https://avatars.mds.yandex.net/get-kinopoisk-image/1600647/18aa74db-68a3-4dda-a216-2ada3ee1e388/1920x',
      releaseDate: '1997',
      description:
          'Демобилизовавшись, Данила Багров вернулся в родной городок. Но скучная жизнь российской провинции не устраивала его, и он решился податься в Петербург, где, по слухам, уже несколько лет процветает его старший брат. Данила нашел брата. Но все оказалось не так просто — брат работает наемным убийцей.',
      isFavorite: true,
    ),
    FilmCardModel(
      id: 1,
      title: 'Служебный роман',
      voteAverage: 8.3,
      picture:
          'https://avatars.mds.yandex.net/get-kinopoisk-image/4774061/ae24156a-3610-452e-a65a-31660b52da6d/1920x',
      releaseDate: '1977',
      description:
          'Анатолий Ефремович Новосельцев, рядовой служащий одного статистического управления — человек робкий и застенчивый. Ему хотелось бы получить вакантное место зав. отделом, но он не знает как подступиться к этому делу.',
      isFavorite: false,
    ),
    FilmCardModel(
      id: 2,
      title: 'Волк с Уолл-стрит',
      voteAverage: 7.9,
      picture:
          'https://avatars.mds.yandex.net/get-kinopoisk-image/1600647/c5876e81-9dec-43e2-923f-fee2fca85e21/1920x',
      releaseDate: '2013',
      description:
          '1987 год. Джордан Белфорт становится брокером в успешном инвестиционном банке. Вскоре банк закрывается после внезапного обвала индекса Доу-Джонса. По совету жены Терезы Джордан устраивается в небольшое заведение, занимающееся мелкими акциями.',
      isFavorite: false,
    ),
    FilmCardModel(
      id: 3,
      title: 'Бриллиантовая рука',
      voteAverage: 8.5,
      picture:
          'https://avatars.mds.yandex.net/get-kinopoisk-image/1946459/3890ba93-b555-4c89-9a51-33dc4e7a421b/1920x',
      releaseDate: '1968',
      description:
          'В южном городке орудует шайка валютчиков, возглавляемая Шефом и его помощником Графом (в быту — Геной Козодоевым). Скромный советский служащий и примерный семьянин Семен Семенович Горбунков отправляется в зарубежный круиз на теплоходе, где также плывет Граф, который должен забрать бриллианты в одном из восточных городов и провезти их в загипсованной руке. Но из-за недоразумения вместо жулика на условленном месте падает ничего не подозревающий Семен Семенович, и драгоценный гипс накладывают ему',
      isFavorite: false,
    ),
    FilmCardModel(
      id: 4,
      title: 'Интерстеллар',
      voteAverage: 8.6,
      picture:
          'https://avatars.mds.yandex.net/get-kinopoisk-image/1600647/78c36c0f-aefd-4102-bc3b-bac0dd4314d8/1920x',
      releaseDate: '2014',
      description:
          'Когда засуха, пыльные бури и вымирание растений приводят человечество к продовольственному кризису, коллектив исследователей и учёных отправляется сквозь червоточину (которая предположительно соединяет области пространства-времени через большое расстояние) в путешествие, чтобы превзойти прежние ограничения для космических путешествий человека и найти планету с подходящими для человечества условиями.',
      isFavorite: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: FilmList.films.length * 100,
      itemBuilder: (context, index) {
        return Material(
          child: InkWell(
            child: FilmTile.fromModel(
                model: FilmList.films[index % FilmList.films.length]),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsFromListMovies(
                        movie: FilmList.films[index % FilmList.films.length]),
                  ));
            },
          ),
        );
      },
    );
  }
}
