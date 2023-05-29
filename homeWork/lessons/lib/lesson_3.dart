// ignore_for_file: public_member_api_docs, sort_constructors_first
/*
Куриная фабрика
Написать Фабрику(Factory) по производству кур(Hen)
1.1. Создать класс Hen
1.1.1. Сделать его абстрактным
1.1.2. Добавить в класс абстрактный метод  int getCountOfEggsPerMonth()
1.1.3. Добавить в класс метод геттер String description, который возвращает строку "Я курица."
1.2. Создать класс RussianHen, который наследуется от Hen
1.3. Создать класс GermanHen, который наследуется от Hen
1.4. Создать класс MoldovanHen, который наследуется от Hen
1.5. Создать класс BelarusianHen, который наследуется от Hen
1.6. В каждом из четырех последних классов написать свою реализацию метода getCountOfEggsPerMonth.
Методы должны возвращать количество яиц в месяц от данного типа куриц.
1.7. В каждом из четырех последних классов написать свою реализацию метода getDescription.
Методы должны возвращать строку вида:
<getDescription() родительского класса>  + <" Моя страна - SSSSS. Я несу N яиц в месяц.">
где SSSSS - название страны
где N - количество яиц в месяц
1.8. В классе HenFactory реализовать меетод getHen, который возвращает соответствующую стране породу кур
1.9. Все созданные вами классы должны быть в отдельных файлах

2.1 Создать интерфейс Printable, содержащий метод void print().
2.2 Создать класс Book с полем name, реализующий интерфейс Printable. (писать в консоль имя книги)
2.3 Создать класс Magazine с полем name, реализующий интерфейс Printable. (писать в консоль имя журнала)
2.4 Создать по 2 экземпляра книг и журналов.

3.1 Создать миксин Burnable с методом void burn() и реализацией (писать в консоль что предмет горит)
3.2 Добавить этот миксин к классам Book и Magazine из второго задания
*/

void main(List<String> args) {
  final rassianHen = RussianHen();
  print(rassianHen.description);
  final robin = Book(name: 'Robin Good')
    ..printName()
    ..burn();
  final eldjeron = Magazine(name: 'Flowers for Eldjeron')..printName();
}

abstract class Hen {
  int getCountOfEggsPerMonth();

  String get description => 'Я курица';
}

class RussianHen extends Hen {
  @override
  String get description =>
      '${super.description} Моя страна - Россия. Я несу ${getCountOfEggsPerMonth()} яиц в месяц';

  @override
  int getCountOfEggsPerMonth() {
    return 35;
  }
}

class GermanHen extends Hen {
  @override
  String get description =>
      '${super.description} Моя страна - Германия. Я несу ${getCountOfEggsPerMonth()} яиц в месяц';

  @override
  int getCountOfEggsPerMonth() {
    return 27;
  }
}

class MoldovanHen extends Hen {
  @override
  String get description =>
      '${super.description} Моя страна - Молдавия. Я несу ${getCountOfEggsPerMonth()} яиц в месяц';

  @override
  int getCountOfEggsPerMonth() {
    return 18;
  }
}

class BelarusianHen extends Hen {
  @override
  String get description =>
      '${super.description} Моя страна - Беларусь. Я несу ${getCountOfEggsPerMonth()} яиц в месяц';

  @override
  int getCountOfEggsPerMonth() {
    return 44;
  }
}

class HenFactory {
  Hen? getHen(String country) {
    switch (country) {
      case 'Россия':
        print('ru');
        return RussianHen();
      case 'Германия':
        return GermanHen();
      case 'Молдавия':
        return MoldovanHen();
      case 'Беларусь':
        return BelarusianHen();
      default:
        throw Exception('Неправильная страна');
    }
  }
}

abstract class Printable {
  void printName();
}

class Book with Burnable implements Printable {
  final String name;
  Book({
    required this.name,
  });

  @override
  void printName() {
    print('Название книги: $name');
  }
}

class Magazine with Burnable implements Printable {
  final String name;
  Magazine({
    required this.name,
  });
  @override
  void printName() {
    print('Название журнала: $name');
  }
}

mixin Burnable {
  void burn() {
    print('Предмет загорелся!!!');
  }
}
