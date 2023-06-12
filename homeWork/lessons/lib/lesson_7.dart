/*
1. Регулярные выражения.

   Имеется текст в файле lesson_7_text.txt.
   Имеется функция для чтения
   Future<String> readTxtFile(String path) => File(path).readAsString();
   где path - путь до файла с текстом
   Создайте функцию
   void task1(String text)
   в которой будет считаться возвращать:

   1) Map<int, List<String>> - Список всех слов, которые хотя бы раз повторяются
      Добавьте расширение к Map<int, List<String>> printAsRepeatedWords(), которая будет выводить в консоль
   Пример:
   3 раза повторяются слова: кот, ток, рука
   2 раза повторяются слова: спина, наушники, ткань

   2) Map<int, List<String>> - Список слов, отсортированный по количеству букв в слове
      Добавьте расширение к Map<int, List<String>> printAsWordLengths(), которая будет выводить в консоль
   Пример:
   5 букв в словах: спина, ткань
   4 буквы в словах: мама, папа

   3) Map<String, int> - Список количества вхождений всех букв русского алфавита в этом тексте, отсортированный по убыванию
      Добавьте расширение к Map<String, int> printAsNumberOfLetters(), которая будет выводить в консоль
   Пример:
   Буква "А": 150 вхождений
   Буква "Ы": 120 вхождений

   4)
     a) Количество заглавных букв
     b) количество прописных
     c) количество знаков препинания
     d) количество цифр.
     Функции оформить как расширения к классу String, с понятными названиями

выполнить функцию можно следующим образом:
  readTxtFile(r'<абсолютный путь к проекту>/dart_language_learning/src/_homeworks/lesson_7_text.txt').then(task1);

  Для поиска по регуляркам - используете методы класса RegExp - stringMatch, allMatches, hasMatch - и т.д.
  там и примеры есть.

2. Выполните 1-ое задание, используя расширения к классу String. Названия должны быть

3. Try-Catch

Создать статический метод который принимает на вход три параметра: login, password и confirmPassword.
Login должен содержать только латинские буквы, цифры и знак подчеркивания.
Длина login должна быть меньше 20 символов. Если login не соответствует этим требованиям,
необходимо выбросить WrongLoginException.
Password должен содержать только латинские буквы, цифры и знак подчеркивания.
Длина password должна быть меньше 20 символов. Также password и confirmPassword должны быть равны.
Если password не соответствует этим требованиям, необходимо выбросить WrongPasswordException.
WrongPasswordException и WrongLoginException - пользовательские классы исключения с двумя конструкторами – один по умолчанию,
второй принимает сообщение исключения и передает его в конструктор класса Exception.
Обработка исключений проводится внутри метода.
Используем multi-catch block.
Метод возвращает true, если значения верны или false в другом случае.


Не успел или забыл рассказать, изучите самим:
1. Статейка про расширения https://habr.com/ru/post/476930/
2. Регулярные выражения https://regex101.com/
*/

/* 1. Прогнать через регулярные выражения файсл/строку стрингов. 
   2. Добавить в список значения членения RegExp в лист (лист всех слов).
   3. Преобразовать лист в сет (уник значения).
   4. Каждый экземпляр пропустить через 1-файл/строку стрингов и подсчитать кол-во раз пересечений.
*/

import 'dart:io';

void main(List<String> args) {
  final String text = pathTest.readAsStringSync();

  final Map<int, List<String>> resultMap = task1(text)..printAsRepeatedWords();
}

//#1
final File pathTest = File('lib/lesson_7_text_test.txt');

// 'F:/Dev/GitHub/lessons_projects-1/homeWork/lessons/lib/lesson_7_text_test.txt';
const String path =
    'F:/Dev/GitHub/lessons_projects-1/homeWork/lessons/lib/lesson_7_text.txt';

Future<String> readTxtFile(String path) => File(path).readAsString();

//#1.1.
Map<int, List<String>> task1(String text) {
  final wordsRegExp = RegExp('[а-я]+', caseSensitive: false); // уточнить

  final Map<int, List<String>> map = {};
  final List<String> wordList = [];
  final Iterable<Match> matches = wordsRegExp.allMatches(text);
  print('matches: \n${matches.toString()}');

  final Set<String> setOfWords = (matches
          .map((e) => e.input.substring(e.start, e.end).toLowerCase())
          .toList())
      .toSet();
  print('setOfWords: \n$setOfWords');

  for (final String item in setOfWords) {
    wordList.clear();
    final counterRegExp =
        RegExp('(^|[^а-яА-Я_])$item(?![а-яА-Я_])', caseSensitive: false);
    print('counterRegExp: \n$counterRegExp');
    final Iterable<Match> repeatsOfWord = counterRegExp.allMatches(text);
    print('repeatsOfWord: \n$repeatsOfWord');
    final k = repeatsOfWord.length;
    print('k: \n$k');
    final key = map.containsKey(k);
    wordList.add(item);
    if (k > 1) {
      if (!key) {
        map.putIfAbsent(k, () => List<String>.from(wordList));
      }
      if (key) {
        map.update(k, (value) => value + List<String>.from(wordList));
      }
    }
  }

  final List<Map<int, List<String>>> listData = [];
  map.forEach((key, value) => listData.add({key: value}));
  print('listData: \n$listData');

  listData.sort(((a, b) {
    final aKey = a.keys.first;
    final bKey = b.keys.first;
    return aKey < bKey ? 1 : -1;
  }));
  print('SortedListData: \n$listData');
  final Map<int, List<String>> sortedMap = {
    for (var e in listData) e.keys.first: e.values.first
  };
  return sortedMap;
}

extension PrintingAsRepeatedWords on Map<int, List<String>> {
  void printAsRepeatedWords() {
    forEach((key, value) {
      if (values.length > 1) {
        print('$key раз повторяются слова: ${value.join(', ')}');
      } else {
        print('$key раз повторяется слово: ${value.join(', ')}');
      }
    });
  }
}
