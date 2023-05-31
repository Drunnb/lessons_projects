/*
1. Создайте функцию, получающие на вход int и возвращающие String 'верно' или 'неверно'
Если переменная a больше нуля и меньше 5-ти

2. Создайте функцию, получающие на вход int и возвращающие double
Если переменная a равна нулю или равна двум, то прибавьте к ней 7, иначе поделите ее на 10.
Проделайте это дважды при помощи тернатрного оператора и конструкции if-else

3. Часть часа
В переменной min лежит число от 0 до 59.
Определите в какую четверть часа попадает это число (в первую, вторую, третью или четвертую).

4. Дни недели;
аргументы функции
int - номера дня недели
int - время, часов
enum Lang - язык (ru, eng)

Если число равно 1, выводим то это 'Понедельник', 2 –”Вторник” и так далее. Если 6 или 7 – “Выходной”.
Так же по времени - от 0 до 8 - ночь, от 8 до 12 - утро, от 12 до 20 день, от 20 до 23 - вечер.
если Lang.ru - выводить на русском, если Lang.eng - на английском

а) Обработать невалидные аргументы
б) функция должна возвращать например, 'Понедельник, день' или то же самое на английском языке
в) сделать у функции необязательный четвертый аргумент - коллбек, возвращающий результат.
г) дважды вызвать функцию и вывести в консоль значения из коллбека и из ретерна
д) создание вспомогательных функций приветствуется



Не успел или забыл рассказать, изучите самим:
1. переменные late
2. проверка assert()
3. почитать про именные конструкторы
4. прочитать про константные конструкторы
*/

void main(List<String> args) {
  print(trueOrFalse(1));
  print(unUsuallFunk(10));
  print(hourCheck(39));
  print(timeToEnter(4, 0, Lang.eng));
  timeToEnter(4, 0, Lang.ru, print);
}

//№1
String trueOrFalse(int number) => number > 0 && number < 5 ? 'yes' : 'no';
//  {
//   if (number > 0 && number < 5) return 'Верно';
//   return 'Неверно';
// }

//№2
double unUsuallFunk(int a) => a == 0 || a == 2 ? a + 7 : a / 10;
// {
//   if (a == 0 || a == 2) {
//     return a + 7;
//   } else {
//     return a / 10;
//   }
// }

// №3
String hourCheck(int min) {
  if (min >= 0 && min <= 15) {
    return 'первая четверть';
  } else if (min >= 16 && min <= 30) {
    return 'вторая четверть';
  } else if (min >= 31 && min <= 45) {
    return 'третья четверть';
  } else if (min >= 46 && min <= 59) {
    return 'четвертая четверть';
  }
  return 'Не корректное значение минут';
}

// №4

enum Lang { ru, eng }

typedef PrintCallBack = void Function(String message);

String timeToEnter(int dayOfWeek, int timeOfNow, Lang loc,
    [PrintCallBack? func]) {
  late String message;
  final String day = cheackDay(dayOfWeek, loc);
  final String time = cheackTime(timeOfNow, loc);
  message = '$day $time';
  func?.call(message);
  return message;
}

String cheackDay(int day, Lang loc) {
  switch (day) {
    case 1:
      return loc == Lang.ru ? 'Понедельник' : 'Monday';

    case 2:
      return loc == Lang.ru ? 'Вторник' : 'Tuesday';

    case 3:
      return loc == Lang.ru ? 'Среда' : 'Wednesday';

    case 4:
      return loc == Lang.ru ? 'Четверг' : 'Thursday';

    case 5:
      return loc == Lang.ru ? 'Пятница' : 'Friday';

    case 6:
    case 7:
      return loc == Lang.ru ? 'Выходной' : 'Weekend';
  }
  return loc == Lang.ru ? 'Некорректный день' : 'Wrong day';
}

String cheackTime(int time, Lang loc) {
  if (time >= 0 && time < 8) {
    return loc == Lang.ru ? 'ночь' : 'night';
  } else if (time >= 8 && time < 12) {
    return loc == Lang.ru ? 'утро' : 'morning';
  } else if (time >= 12 && time < 20) {
    return loc == Lang.ru ? 'день' : 'morning';
  } else if (time >= 20 && time <= 23) {
    return loc == Lang.ru ? 'вечер' : 'evening';
  }
  return loc == Lang.ru ? 'Некоректное время' : 'Wrong time';
}
