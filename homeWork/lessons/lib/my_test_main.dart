
void main(List<String> args) {
  final String text = ' новые слова тоже хотелось бы включить куда-нибудь';
  final Iterable<Match> matches =
      RegExp("[а-я]+", caseSensitive: false).allMatches(text);
  final Set<String> setOfWords = (matches
          .map((e) => e.input.substring(e.start, e.end).toLowerCase())
          .toList())
      .toSet();

  for (var element in setOfWords) {
    print(element);
  }

  print(setOfWords);
}
