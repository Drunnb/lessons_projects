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
      case '':
        print("empty language");
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
      '01', 'behind ur maind', 'picture', 8.9, 'releaseDate', 'aboit me', 'ru'),
  Movie('02', 'morder', 'picture2', 6.0, 'releaseDate2', 'aboit morder', 'en'),
  Movie('03', 'home', 'picture4', 9.9, 'releaseDate4', 'aboit home', 'de'),
  Movie('04', 'long way', 'picture5', 5.9, 'releaseDate5', 'aboit long way',
      'ru'),
];

Future<void> moviesListShow(List<Movie> listOfMovie) async {
  listOfMovie.forEach((element) {
    print(element.title);
  });
}
