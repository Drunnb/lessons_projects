import 'dart:async';

void main() {
  final Movie newCinema = Movie('01', 'behind ur maind', 'picture', 8.9,
      'releaseDate', 'aboit my maind', 'ru');

  newCinema.showIdAndTitle();
  newCinema.fromStringEnum(newCinema.language);
  print('from String language -' + newCinema._languageType.toString());
  print('from Enum language - ' + newCinema._languageType.toPrettyString());

  moviesListShow(moviesList);

  var filtered = moviesList
      .where((e) => e.voteAverage > 9.0)
      .forEach((e) => print(e.title));
}

//1
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

  void showIdAndTitle() {}
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

  @override
  void showIdAndTitle() {
    print('i show u ID and Title \nid: ${this.id} \ntitle:${this.title}');
  }
}

//3
enum Language { ru, en, ge }

mixin LanguageMixin {
  late Language _languageType;

  Language? fromStringEnum(String languageFromString) {
    switch (languageFromString) {
      case 'ru':
        // print("Russian");
        _languageType = Language.ru;
        break;
      case 'en':
        // print('English');
        _languageType = Language.en;
        break;
      case 'de':
        // print('Germany');
        _languageType = Language.ge;
        break;
      case '':
        print("empty language");
        break;
    }

    return null;
  }
}

//4
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

//2-2

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

//2-3  не сообразил как сделать, может быть когда нибудь потом

// var filtered = moviesList
//       .where((e) => e.voteAverage > 9.0)
//       .forEach((e) => print(e.title));






//для размышления
// enum MediaType { movie, tv }

// extension MediaTypeAsString on MediaType {
//   String asString() {
//     switch (this) {
//       case MediaType.movie:
//         return 'movie';
//       case MediaType.tv:
//         return 'tv';
//     }
//   }
// }

// extension LanguagePreferenceForString on String {
// LanguagePreferenceEntity toLanguagePrerence() {
// switch (this) {
//   case "english":
//     return LanguagePreferenceEntity.english;
//   case "turkish":
//     return LanguagePreferenceEntity.turkish;
//   default:
//     return LanguagePreferenceEntity.english;
//   }
//  }
// }

// PaintableRect()
//   ..paint(Color.green)
//   ..draw();
// PaintableContainer()
//   ..paint(Color.yellow)
//   ..render();

// enum Topic { none, computing, general }

// extension TopicString on String {
//   Topic get topic {
//     switch (this) {
//       case 'computing':
//         return Topic.computing;
//       case 'general':
//         return Topic.general;
//       case 'none':
//         return Topic.none;
//     }
//   }
// }

// extension TopicExtension on Topic {
//   String get string {
//     switch (this) {
//       case Topic.computing:
//         return 'computing';
//       case Topic.general:
//         return 'general';
//       case Topic.none:
//         return 'none';
//     }
//   }
// }
// enum Color { red, yellow, green }

// mixin PaintableMixin {
//   late Color _color;
//   void paint(Color color) {
//     _color = color;
//   }

//   Color get color => _color;
// }

// class PaintableRect with PaintableMixin {
//   void draw() {
//     print('Draw rectangle with color $color');
//   }
// }

// class PaintableContainer with PaintableMixin {
//   void render() {
//     print('Render container with color $color');
//   }
// }
