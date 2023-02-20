// ignore_for_file: avoid_print

abstract class MovieParameters {
  String id;
  String title;
  String picture;
  double voteAverage;
  String releaseDate;
  String description;
  String language;
  MovieParameters(
    this.id,
    this.title,
    this.picture,
    this.voteAverage,
    this.releaseDate,
    this.description,
    this.language,
  );
}

//2
class Movie extends MovieParameters with LanguageMixin {
  Movie(
    super.id,
    super.title,
    super.picture,
    super.voteAverage,
    super.releaseDate,
    super.description,
    super.language,
  );
}

enum Language { ru, en, ge }

mixin LanguageMixin {
  late Language languageType;

  Language? fromStringEnum(String languageFromString) {
    switch (languageFromString) {
      case 'ru':
        // print("Russian");
        languageType = Language.ru;
        break;
      case 'en':
        // print('English');
        languageType = Language.en;
        break;
      case 'de':
        // print('Germany');
        languageType = Language.ge;
        break;
    }

    return null;
  }
}

extension LanguageExtension on Language {
  String toPrettyString() {
    switch (this) {
      case Language.en:
        return 'English';
      case Language.ru:
        return 'Russian';
      case Language.ge:
        return 'Germany';
    }
  }
}

List<Movie> moviesList = [
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

Future<void> moviesListShow(List<Movie> listOfMovie) async {
  for (var element in listOfMovie) {
    print(element.title);
  }
}
