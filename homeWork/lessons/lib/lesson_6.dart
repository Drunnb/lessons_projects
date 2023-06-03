/*
1. Для данного натурального числа n напечатайте число,
   записанное теми же десятичными цифрами, но в обратном порядке.
   Задание выполнить через цикл.

2. а) Создайте лист из 15 случайных чисел в диапазоне от 5 до 60;
      Для генерации случайного числа использовать Random() из пакета math.
      Не следует каждый раз создавать экземляр класса Random()
   b) Создайте формулы для получения максимального, минимального и среднего значения.
   c) Прочитайте про различные виды сортировок.
      https://academy.yandex.ru/posts/osnovnye-vidy-sortirovok-i-primery-ikh-realizatsii
   d) Реализуйте "сортировку пузырьком" данного листа.

3. Напишите программу, которая выводит на консоль простые числа в промежутке от [2, 500].
   Используйте для решения этой задачи оператор "%" (остаток от деления) и циклы.

4. Даны два целых числа A и В. Используюя рекурсию, выведите все числа от A до B включительно,
   в порядке возрастания, если A < B, или в порядке убывания в противном случае.


Не успел или забыл рассказать, изучите самим:
1. Сортировки. Необходимо для задачи 2.
2. Посмотреть и пощупать стандартные методы классов String, bool, int, double
3. Прочитайте про деревья https://javarush.ru/groups/posts/3111-strukturih-dannihkh-dvoichnoe-derevo-v-java
   Для чего они нужны и как прозходить элементы дерева при помощи рекурсии.
*/
import 'dart:math';

void main(List<String> args) {
//#1
  final reversNumber = mirrorNumber(6991);
  print(reversNumber);

//#2
  final Random random = Random();

//a
  final List<int> generatedList =
      List<int>.generate(15, (index) => random.nextInt(55) + 5);
  print('Сгенерированный список: \r$generatedList');

//b
  calculateListNumbers(generatedList);

//d
  List<int> sortedList = bubbleSortList(generatedList);
  print(sortedList);

//#3
  showPrimeNumber(2, 500);

//#4
  printAllNumbersBetween(10, 10);
}

int mirrorNumber(int number) {
  String result = '';

  while (number ~/ 10 > 0) {
    final String tempLastPartNumber = (number % 10).toString();
    number = number ~/ 10;
    result = result + tempLastPartNumber;
  }
  result = result + number.toString();
  return int.parse(result);
}

int maxOfList(List<int> list) {
  int maxEl = 0;

  for (final element in list) {
    if (element > maxEl) {
      maxEl = element;
    }
  }
  return maxEl;
}

int minOfList(List<int> list) {
  int minEl = 99;
  for (final element in list) {
    if (element < minEl) {
      minEl = element;
    }
  }
  return minEl;
}

double midOfList(List<int> list) {
  double mid = 0;
  for (var i = 0; i < list.length; i++) {
    mid = mid + list[i].toDouble();
  }
  mid = mid / list.length;
  return mid;
}

void calculateListNumbers(List<int> list) => print(
    'Максимальный элемент: ${maxOfList(list)} \nМинимальный элемент: ${minOfList(list)} \nСреднее значение: ${midOfList(list)}');

List<int> bubbleSortList(List<int> list) {
  for (var i = 0; i < list.length; i++) {
    for (var j = 0; j <= list.length - 1; j++) {
      if (list[i] < list[j]) {
        int tempValue = list[j];
        list[j] = list[i];
        list[i] = tempValue;
      }
    }
  }
  return list;
}

void showPrimeNumber(int start, int stop) {
  String result = 'Простые числа:\n';
  for (int i = start; i <= stop; i++) {
    bool isPrime = true;
    final double squareRoot = sqrt(i) + 2;
    int j = 2;
    while (j <= squareRoot && isPrime) {
      if (i % j == 0) isPrime = false;
      j++;
    }
    if (isPrime) {
      result += ' ${i.toString()}';
    }
  }
  print(result);
}

void printAllNumbersBetween(int a, int b) {
  if (a > b) {
    print(a);
    printAllNumbersBetween(a - 1, b);
  } else if (a < b) {
    printAllNumbersBetween(a, b - 1);
    print(b);
  } else {
    return;
  }
}
