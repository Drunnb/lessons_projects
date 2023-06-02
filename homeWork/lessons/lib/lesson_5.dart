/*
1. Операции с List
   В этом задании можно (и даже нужно) иногда создавать новые экземпляры листов и продолжать уже с ними
   В этом задании НЕЛЬЗЯ использовать циклы. Толкьо методы List и Iterable

a) Создайте List<int> из 20 случайных чисел в диапазоне от 0 до 100. Выведите в консоль.
   Для генерации случайного числа использовать Random().nextInt(100) из пакета math.
   Не следует каждый раз создавать экземляр класса Random()
b) Выведите в консоль длину листа.
с) Уберите из листа все числа, кратные 5 и 7. Выведите в консоль.
d) Отсортируйте лист по возрастанию. Выведите в консоль.
e) Отсортируйте лист таким образом, что сначала идут четные, затем нечетные,
   при этом не нарушая сортировку по возрастанию, внутри четной и нечетных частей. Выведите в консоль.
   Для этого создайте собственную функцию-компаратор.
f) Удалите первый и последний элемент списка. Выведите в консоль.
g) Измените все элементы листа, добавив к ним 1. Выведите в консоль.
h) Добавьте в лист еще елементы, каждый из которых будет на 100 больше элемента из списка. Выведите в консоль.
   Используйте функцию expand
i) Перемешайте элементы листа в случайном порядке. Выведите в консоль.
j) Найдите первое число больше 100 в листе. Выведите в консоль.
k) Найдите индекс этого числа. Выведите в консоль.
l) Проверить, находится ли в списке хотя бы одно число из 100, 37, 55, 99, 64. Результат проверки вывестив  консоль.
m) Посчитать сумму всех чисел в листе. Выведите в консоль.
n) Превратить все элементы листа в String таким образом, чтобы каждый лемемент был 'Number <element>'.
   Выведите в консоль.
o) Используя лист из задания n, превратите оего обратно в List<int> при помощи функции int.parse()
   и функциями класса String.
   При помощи функции expand каждый элемент запишите трижды в лист.
   Выведите в консоль.

2. Операции с Set (так как создается по дефолту LinkedHashSet, они, в большинстве своем, повторяют операции из List)

Создайте Set из последнего результирующего листа прошлого задания.

3. Операции с Map

a) Создайте Лист из последнего сета. Создайте Map<int, int> из листа, используя функцию asMap() листа.
   Выведите в консоль.
   Обратите внимание на специфику метода asMap().
b) Создать объект GoldenRationSize(int smallSide), c полями int smallSide,
   int bigSide и переопределением поля toString().
   Большая сторона высчитывается через коэффициент золотого сечения и округляется.
c) Заменить values в мапе на объекты GoldenRationSize, передавая значение в конструктор.
   должна получиться Map<int, GoldenRationSize>. Выведите в консоль.


Не успел или забыл рассказать, изучите самим:
1. Iterator
2. односвязный, двусвязные списки
*/

import 'dart:math';

void main(List<String> args) {
//№1
//a)
  final numbersList = List<int>.generate(20, (index) => Random().nextInt(100));
  print('сгенерированный лист: \n$numbersList');

//b)
  print('длинна листа: \n${numbersList.length}');

//c)
  final withoutFiveAndSevenList = List<int>.from(numbersList);
  withoutFiveAndSevenList
      .removeWhere((element) => element % 5 == 0 || element % 7 == 0);

  print('лист без кратных значений 5 и 7: \n$withoutFiveAndSevenList');

//d)
  final sortedListbyStock = List<int>.from(withoutFiveAndSevenList);
  sortedListbyStock.sort();
  print('отсортированный лист: \n$sortedListbyStock');

//e)
  final sortedListbyEven = List<int>.from(sortedListbyStock);
  sortedListbyEven.sort(evenComperator);
  print('отсортированный лист по четности: \n$sortedListbyEven');

//f)
  final withoutFirstAndLastElList = List<int>.from(sortedListbyEven);
  withoutFirstAndLastElList
    ..removeAt(0)
    ..removeLast();
  print(
      'Лист без первого и последнего элементов: \n$withoutFirstAndLastElList');

//g)
  final plusOneElList =
      List<int>.from(withoutFirstAndLastElList).map((e) => e + 1).toList();

  print('Лист с значениями +1: \n$plusOneElList ');

//h
  final expandList = List<int>.from(plusOneElList)
      .expand((element) => [element, element + 100])
      .toList();

  print('Лист с добавленными значениями +100: \n$expandList ');

  //i
  final shuffleList = List<int>.from(expandList)..shuffle();
  print('Перемешанный лист: \n$shuffleList');

  //j
  final firstNumber100 = shuffleList.firstWhere((element) => element > 100);
  print('Первое число >100: \n$firstNumber100');

  //k
  final indexFitstNumber100 = shuffleList.indexOf(firstNumber100);
  print('Индекс числа >100: \n$indexFitstNumber100');

  //l
  final listcheck = <int>[100, 37, 55, 99, 64];
  final checkNumbers =
      shuffleList.any(((element) => listcheck.contains(element)));
  print('Результат проверки: \n$checkNumbers');

  //m
  final sumOfElements =
      shuffleList.fold(0, (previousValue, element) => previousValue + element);
  print('Сумма всех элементов списка: \n$sumOfElements');

  //n
  final listOfStrings = shuffleList.map((e) => 'Nubmer $e').toList();
  print('Лист строчных значений: \n$listOfStrings');

  //o
  final recoveryToIntList = listOfStrings
      .map((e) => e.replaceAll(RegExp(r"[^0-9]+"), ''))
      .map((e) => int.parse(e))
      .expand((element) => [element, element, element])
      .toList();
  print('Лист численных значений значений: \n$recoveryToIntList');

  //№2

  final setFromList = recoveryToIntList.toSet();
  print(setFromList);

  //№3

  //a)
  final mapFromListSet = setFromList.toList().asMap();
  print('Мап из сет-листа: \n$mapFromListSet');

  //c
  final newMapWithGSize = mapFromListSet.map((key, value) =>
      MapEntry<int, GoldenRationSize>(key, GoldenRationSize(value)));
  print(newMapWithGSize);
}

int evenComperator(int a, int b) {
  if (a.isEven && b.isOdd) return -1;
  if (a.isOdd && b.isEven) return 1;
  return 0;
}

//b
class GoldenRationSize {
  final int smallSide;
  final int bigSide;
  GoldenRationSize(this.smallSide) : bigSide = (smallSide * 1.618).round();

  @override
  String toString() {
    return 'smallSide:$smallSide  bigSide:$bigSide \n';
  }
}
