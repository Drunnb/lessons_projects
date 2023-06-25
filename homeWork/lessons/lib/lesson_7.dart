/*
Строение функции 
Map<int, List<String>> myTask(String text) {
  //Мапа ?
  final Map<int, List<String>> map = {};
  //ЛИст Слов ?
  final List<String> wordList = [];
  //Дробим текст на слова и пихаем в перечисления
  final Iterable<Match> matches = CastomRegExp.wordsRegExp.allMatches(text);
  //Преобразуем перечисления в сет, через метод МАП(уникальные слова от номера позиции символа слова к концу позиции символа)
  final Set<String> setOfWords = (matches
          .map((e) => e.input.substring(e.start, e.end).toLowerCase())
          .toList())
      .toSet();
  // Пробегаем по всем словам сета
  for (final String item in setOfWords) {
    //Очищаем список слов
    wordList.clear();
    //Отбрасываем лишние знаки от слов
    final counterRegExp =
        RegExp('(^|[^а-яА-Я_])$item(?![а-яА-Я_])', caseSensitive: false);
    // Проверяем слова, отбрасывая доп символы, получаем перечисление "чистых слов"
    final Iterable<Match> repeatsOfWord = counterRegExp.allMatches(text);
    //Узнаем кол-во "чистых слов" в перечислении
    final k = repeatsOfWord.length;
    //Проверяем на вхождение ключ в мапу
    final key = map.containsKey(k);
    //Добавляем стринг значение (перечисление) в лист типа стринг
    wordList.add(item);
    //Если слово повторяется, проверяем дальше на соответствие
    if (k > 1) {
      //Если ключа нет, то добавляем в мапу ключ + значение
      if (!key) {
        map.putIfAbsent(k, () => List<String>.from(wordList));
      }
      //Если ключ есть, то обновляем  мапу, записываем значение ключа
      if (key) {
        map.update(k, (value) => value + List<String>.from(wordList));
      }
    }
  }
//Создаем лист мап
  final List<Map<int, List<String>>> listData = [];
//Из старой мапы переносим все значения в лист мап
  map.forEach((key, value) => listData.add({key: value}));
//Сортируем Лист Мап по ключу, от большего к меньшему
  listData.sort(((a, b) {
    final aKey = a.keys.first;
    final bKey = b.keys.first;
    return aKey < bKey ? 1 : -1;
  }));
  Map<int, List<String>> sortedMap = {
    for (var e in listData) e.keys.first: e.values.first
  };

  return sortedMap;
}





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

void main(List<String> args) async {
  // Map<int, List<String>> repeatedWords = await readTxtFile(pathTest).then(task1)
  //   ..printAsRepeatedWords();
  // Map<int, List<String>> lenghtOfWords = await readTxtFile(pathTest).then(task2)
  //   ..printAsWordLenghts();
  // Map<String, int> lettersOnText = await readTxtFile(pathTest).then(task3)
  //   ..printAsNumberOfLetters();
  String texting = '';
  String repeatedString =
      await readTxtFile(pathTest).then((value) => texting = value);
  texting.printAsWordLengthsExtension;
  final bool newUser = UserValidating.userCheck(
      login: 'login', password: 'password', confirmPassword: 'password');
  print(newUser);
}

//#1
final String pathTest =
    'F:/Dev/GitHub/lessons_projects-1/homeWork/lessons/lib/lesson_7_text_test.txt';

// 'F:/Dev/GitHub/lessons_projects-1/homeWork/lessons/lib/lesson_7_text_test.txt';
const String path =
    'F:/Dev/GitHub/lessons_projects-1/homeWork/lessons/lib/lesson_7_text.txt';

Future<String> readTxtFile(String path) =>
    File(path).readAsString().whenComplete(() => print('file readed'));

class CastomRegExp {
  static final wordsRegExp = RegExp('[а-я]+', caseSensitive: false);
  static final lettersRegExp = RegExp('[а-я]', caseSensitive: false);
}

//#1.1.
Map<int, List<String>> task1(String text) {
  final Map<int, List<String>> map = {};
  final List<String> wordList = [];
  final Iterable<Match> matches = CastomRegExp.wordsRegExp.allMatches(text);

  final Set<String> setOfWords = (matches
          .map((e) => e.input.substring(e.start, e.end).toLowerCase())
          .toList())
      .toSet();

  for (final String item in setOfWords) {
    wordList.clear();
    final counterRegExp =
        RegExp('(^|[^а-яА-Я_])$item(?![а-яА-Я_])', caseSensitive: false);
    final Iterable<Match> repeatsOfWord = counterRegExp.allMatches(text);
    final k = repeatsOfWord.length;
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

  listData.sort(((a, b) {
    final aKey = a.keys.first;
    final bKey = b.keys.first;
    return aKey < bKey ? 1 : -1;
  }));
  Map<int, List<String>> sortedMap = {
    for (var e in listData) e.keys.first: e.values.first
  };

  return sortedMap;
}

extension PrintingAsRepeatedWords on Map<int, List<String>> {
  void printAsRepeatedWords() {
    forEach((key, value) {
      if (values.length > 1) {
        print('\n$key раз повторяются слова: ${value.join(', ')}');
      } else {
        print('\n$key раз повторяется слово: ${value.join(', ')}');
      }
    });
  }
}

//#1.2
Map<int, List<String>> task2(String text) {
  final Map<int, List<String>> map = {};
  final List<String> wordList = [];
  final Iterable<Match> matches = CastomRegExp.wordsRegExp.allMatches(text);
  final Set<String> setOfWords = (matches
          .map((e) => e.input.substring(e.start, e.end).toLowerCase())
          .toList())
      .toSet();
  for (final String item in setOfWords) {
    wordList.clear();
    final int length = item.length;
    wordList.add(item);
    final bool key = map.containsKey(length);
    if (!key) {
      map.putIfAbsent(length, () => List<String>.from(wordList));
    }
    if (key) {
      map.update(length, (value) => value + List<String>.from(wordList));
    }
  }
  final List<Map<int, List<String>>> listData = [];
  map.forEach((key, value) => listData.add({key: value}));
  listData.sort(((a, b) {
    final int aKey = a.keys.first;
    final int bKey = b.keys.first;
    return aKey < bKey ? 1 : -1;
  }));
  final Map<int, List<String>> sortedMap = {
    for (var e in listData) e.keys.first: e.values.first
  };
  return sortedMap;
}

extension PrintingAsWordLengths on Map<int, List<String>> {
  void printAsWordLenghts() {
    forEach((key, value) {
      if (value.length > 1) {
        print('$key букв в словах: ${value.join(', ')}');
      } else {
        print('$key букв в слове: ${value.join(', ')}');
      }
    });
  }
}

//#1.3
Map<String, int> task3(String text) {
  final Map<String, int> map = {};
  final Iterable<Match> matches = CastomRegExp.lettersRegExp.allMatches(text);
  final Set<String> setOfLetters = (matches
          .map((e) => e.input.substring(e.start, e.end).toUpperCase())
          .toList())
      .toSet();
  for (final String item in setOfLetters) {
    final counter = RegExp(item, caseSensitive: false);
    final Iterable<Match> repeatsOfLetters = counter.allMatches(text);
    final int k = repeatsOfLetters.length;
    map.putIfAbsent(item, () => k);
  }
  final List<Map<String, int>> listData = [];
  map.forEach((key, value) => listData.add({key: value}));
  listData.sort(((a, b) {
    final int aKey = a.values.first;
    final int bKey = b.values.first;
    return aKey < bKey ? 1 : -1;
  }));
  final Map<String, int> sortedMap = {
    for (var e in listData) e.keys.first: e.values.first
  };
  return sortedMap;
}

extension PrintingAsNumberOfLetters on Map<String, int> {
  void printAsNumberOfLetters() {
    forEach((key, value) {
      print('Буква $key: $value вхождений');
    });
  }
}

//#1.4
//a)
extension UpperCaseLettersOnText on String {
  String get getUpperCaseLettersOnText {
    final int captialLettersLenghts = RegExp('[А-Я]').allMatches(this).length;
    return 'Заглавных букв в тексте: $captialLettersLenghts';
  }
}

//b)
extension LowerCaseLettersOnText on String {
  String get getLowerCaseLettersOnText {
    final int lowerCaseLettersLenghts = RegExp('[а-я]').allMatches(this).length;
    return 'Заглавных букв в тексте: $lowerCaseLettersLenghts';
  }
}

//c)
extension SymbolsOnText on String {
  String get getSymbolsOnText {
    final int symbolsLenghts = RegExp('[^А-Яа-я0-9_]').allMatches(this).length;
    return 'Количество символов в тексте: $symbolsLenghts';
  }
}

//d)
extension DigitsOnText on String {
  String get getDigitsOnText {
    final int digitsLenghts = RegExp('[0-9]').allMatches(this).length;
    return 'Цифр в тексте: $digitsLenghts';
  }
}

//#2

extension PrintingAsRepeatedWordsExtension on String {
  void get printAsRepeatedWordsExtension {
    final wordsRegExp = RegExp('[а-я]+', caseSensitive: false);
    final map = <int, List<String>>{};
    final wordList = List<String>.empty(growable: true);
    final Iterable<Match> matches = wordsRegExp.allMatches(this);
    final Set<String> setOfWords =
        (matches.map((e) => e.input.substring(e.start, e.end).toLowerCase()))
            .toList()
            .toSet();

    for (final String item in setOfWords) {
      wordList.clear();
      final counter =
          RegExp('(^|[^а-я_])$item(?![а-я_])', caseSensitive: false);
      final Iterable<Match> repeatsOfWord = counter.allMatches(this);
      final k = repeatsOfWord.length;
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

    listData.sort((a, b) {
      final aKey = a.keys.first;
      final bKey = b.keys.first;
      return aKey < bKey ? 1 : -1;
    });

    final Map<int, List<String>> sortedMap = {
      for (var e in listData) e.keys.first: e.values.first
    }..forEach((key, value) {
        if (value.length > 1) {
          print('$key раз повторяются слова: ${value.join(', ')}');
        } else {
          print('$key раз повторяется слово: ${value.join(', ')}');
        }
      });
  }
}

extension PrintingAsWordLengthsExtension on String {
  void get printAsWordLengthsExtension {
    final wordsRegExp = RegExp('[а-я]+', caseSensitive: false);
    final map = <int, List<String>>{};
    final wordList = List<String>.empty(growable: true);
    final Iterable<Match> matches = wordsRegExp.allMatches(this);
    final Set<String> setOfWords = (matches
            .map((e) => e.input.substring(e.start, e.end).toLowerCase())
            .toList())
        .toSet();

    for (final String item in setOfWords) {
      wordList.clear();
      final length = item.length;
      wordList.add(item);
      final key = map.containsKey(length);
      if (!key) {
        map.putIfAbsent(length, () => List<String>.from(wordList));
      }
      if (key) {
        map.update(length, (value) => value + List<String>.from(wordList));
      }
    }

    final List<Map<int, List<String>>> listData = [];
    map.forEach((key, value) => listData.add({key: value}));

    listData.sort((a, b) {
      final aKey = a.keys.first;
      final bKey = b.keys.first;
      return aKey < bKey ? 1 : -1;
    });

    final Map<int, List<String>> sortedMap = {
      for (var e in listData) e.keys.first: e.values.first
    }..forEach((key, value) {
        if (value.length > 1) {
          print('$key букв в словах: ${value.join(', ')}');
        } else {
          print('$key букв в слове ${value.join(', ')}');
        }
      });
  }
}

extension PrintingAsNumberOfLettersExtension on String {
  void get printAsNumberOfLettersExtension {
    final lettersRegExp = RegExp('[а-я]', caseSensitive: false);
    final map = <String, int>{};
    final Iterable<Match> matches = lettersRegExp.allMatches(this);
    final Set<String> setOfLetters =
        (matches.map((e) => e.input.substring(e.start, e.end).toUpperCase()))
            .toList()
            .toSet();

    for (final item in setOfLetters) {
      final counter = RegExp(item, caseSensitive: false);
      final Iterable<Match> repeatsOfLetter = counter.allMatches(this);
      final k = repeatsOfLetter.length;
      map.putIfAbsent(item, () => k);
    }

    final List<Map<String, int>> listData = [];
    map.forEach((key, value) => listData.add({key: value}));

    listData.sort((a, b) {
      final aKey = a.values.first;
      final bKey = b.values.first;
      return aKey < bKey ? 1 : -1;
    });

    final Map<String, int> sortedMap = {
      for (var e in listData) e.keys.first: e.values.first
    }..forEach((key, value) {
        print('Буква "$key": $value вхождений');
      });
  }
}
//#3

class WrongLoginException implements Exception {
  final String message;

  WrongLoginException(this.message);
  WrongLoginException.toParent(this.message) : super();
}

class WrongPasswordException implements Exception {
  final String message;

  WrongPasswordException(this.message);
  WrongPasswordException.toParent(this.message) : super();
}

class UserValidating {
  static bool userCheck(
      {required String login,
      required String password,
      required String confirmPassword}) {
    try {
      if (login.length > 20) {
        throw WrongLoginException('Слишком длинный логин');
      }
      if (login.contains(RegExp('[^A-Za-z _ 0-9]'))) {
        throw WrongLoginException(
            'Логин должен содержать только буквы и цифры английского алфавита а также символ "_"');
      }
      if (password.length > 20) {
        throw WrongPasswordException(
            'Пароль не должен содержать больше 20-ти символов');
      }
      if (password.contains(RegExp('[^A-Za-z _ 0-9]'))) {
        throw WrongPasswordException(
            'Пароль должен содержать только буквы и цифры английского алфавита а также символ "_"');
      }
      if (password != confirmPassword) {
        throw WrongPasswordException('Пароли не совпадают');
      }
    } on WrongLoginException catch (e) {
      print(e.message);
      return false;
    } on WrongPasswordException catch (e) {
      print(e.message);
      return false;
    }

    print('Successful');
    return true;
  }
}
