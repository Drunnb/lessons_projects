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
  final poemRepository = JokeRepository();
  Future<Joke> poems = poemRepository.getFiveRandomPoems();
  poems.then((value) {
    translator
        .translate(
          value.insult,
          to: 'ru',
        )
        .then(print);
    // print(value.insult);
  });
}
