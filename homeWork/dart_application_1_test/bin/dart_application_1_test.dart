import 'package:dart_application_1_test/dart_application_1_test.dart'
    as dart_application_1_test;

void main(List<String> arguments) {
  print('Hello world: ${dart_application_1_test.calculate()}!');

  final joke =
      dart_application_1_test.JokeRepository().getFiveRandomPoems().then(print);
}
