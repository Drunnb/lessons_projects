// ignore_for_file: public_member_api_docs, sort_constructors_first
/*

Задачи
1. Создайте цепочку реальных объектов наследования, длиною 5 объектов. У каждого объекта должны быть поля и каждый child должен добавлять новые поля.

2. Создать класс Person, который содержит: 
переменные fullName, age;
методы move() и talk(), в которых просто вывести на консоль сообщение -"Такой-то  Person говорит". 
Добавьте конструктор Person(fullName, age).
Создайте два объект этого класса. Объект инициализируется конструктором Person(fullName, age).

3. Реализуйте класс Student (Студент), который будет наследоваться от класса Person.
Класс должен иметь следующие свойства:

yearOfAdmission:DateTime (год поступления в вуз): инициализируется в конструкторе
currentCourse:int (текущий курс): рассчитывается след. образом - из текущего года вычесть год поступления.
чтобы получить настоящее время - DateTime.now()
чтобы получить годы из DateTime, воспользуйтесь свойством DateTime.year
Класс должен иметь метод toString() , с помощью которого можно вывести:

имя и фамилию студента - используя родительскую реализацию toString
год поступления
текущий курс

*/

void main(List<String> args) {
  final Person Divora = Person('Divora Pchelka Amumu', 25);
  final Person Scorpion = Person('Scorpion Red Fire', 99);
  Divora.talk();
  Scorpion.move();
  final Bobby = Student('Bob Marley', 22, yearOfAdmission: DateTime(2020));
  print(Bobby.toString());
}

//1

// var myVehicle = Vehicle('Bobby Fisher');
// print(myVehicle.autor);
// var myTracktor = LamborginyTracktor('Lamb', maxSpeed: 35);
// print(
//   'autor:${myTracktor.autor}\nhieght:${myTracktor.hieght}\nhave eqwip:${myTracktor.haveEqwip}\ntype eqwip:${myTracktor.typeEqwip}\nmax speed:${myTracktor.maxSpeed}',
// );

class Vehicle {
  String autor;
  Vehicle([this.autor = 'Jhon Gitkot']);
}

class Tractor extends Vehicle {
  double hieght;
  Tractor(
    String autor,
    this.hieght,
  ) : super(autor) {
    hieght = 2.11;
  }
}

class SpecialTractor extends Tractor {
  bool haveEqwip = false;
  SpecialTractor(
    String autor,
    String type,
    double hieght, {
    required this.haveEqwip,
  }) : super(autor, hieght);
}

class FieldTractor extends SpecialTractor {
  String typeEqwip;
  FieldTractor(
    String autor,
    String type, {
    required this.typeEqwip,
  }) : super(autor, type, 0.0, haveEqwip: true) {
    type = 'Field';
  }
}

class LamborginyTracktor extends FieldTractor {
  double maxSpeed;
  LamborginyTracktor(
    String autor, {
    required this.maxSpeed,
  }) : super('Lamb99', 'Field', typeEqwip: 'Plugh') {
    this.autor = autor;
    haveEqwip = haveEqwip;
    typeEqwip = typeEqwip;
    hieght = 3.0;
  }
}

//№2
class Person {
  String fullName;
  int age;
  Person(
    this.fullName,
    this.age,
  );

  void move() {
    print('$fullName идет');
  }

  void talk() {
    print('$fullName говорит');
  }
}

//№3
class Student extends Person {
  DateTime yearOfAdmission;
  late int currentCourse;
  Student(
    String fullName,
    int age, {
    required this.yearOfAdmission,
  }) : super(fullName, age) {
    currentCourse = DateTime.now().year - yearOfAdmission.year;
  }

  @override
  String toString() {
    return 'Имя и фамилия студенда: $fullName \nГод поступления: ${yearOfAdmission.year} \nТекущий курс: $currentCourse';
  }
}
