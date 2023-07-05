/*
В зависимостях появилась библиотека translator: ^0.1.7
Необходимо зайти в pubspec.yaml и нажать на pub get или в корне проекта, в терминале вызвать dart pub get
Теперь вы можете создать объект
final translator = GoogleTranslator();

Используя репозиторий PoemRepository, получите 5 случайных поэм с описанием.
Переведите их описания и названия.

сделайте это двумя способавми. Через  then и async - await
*/

import 'package:lessons/lesson_8_utils.dart';
import 'package:translator/translator.dart';

void main(List<String> args) async {
  final translator = GoogleTranslator();
  final jokeRepository = JokeRepository();
  jokeRepository
      .getRandomJoke()
      .then((value) => translator.translate(value.insult, to: 'ru'))
      .then(print);

  jokeRepository.getFiveRandomJokes().then((value) {
    for (var element in value) {
      translator.translate(element.insult, to: 'ru').then(print);
    }
  });

  final Joke jokeFromAsync = await jokeRepository.getRandomJoke();
  final Translation translatedJokeFromAsync =
      await translator.translate(jokeFromAsync.toString(), to: 'ru');
  print('translatedJokeFromAsync: $translatedJokeFromAsync');

  final List<Joke> listJokesFromAsync =
      await jokeRepository.getFiveRandomJokes();
  for (final joke in listJokesFromAsync) {
    final translated = await translator.translate(joke.toString(), to: 'ru');
    print(translated);
  }
}
