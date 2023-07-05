import 'dart:convert';
import 'package:http/http.dart' as http;

int calculate() {
  return 6 * 7;
}

class JokeRepository {
  final _randomJokeUri =
      Uri.parse('https://evilinsult.com/generate_insult.php?lang=en&type=json');
  // Uri.parse('https://www.poemist.com/api/v1/randompoems');

  Future<Joke> getFiveRandomPoems() async {
    final response = await http.get(_randomJokeUri);
    if (response.statusCode == 200) {
      return Joke.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Joke');
    }
  }
}

class Joke {
  final String number;
  final String language;
  final String insult;
  final String created;

  const Joke({
    required this.number,
    required this.language,
    required this.insult,
    required this.created,
  });

  factory Joke.fromMap(Map<String, dynamic> map) {
    return Joke(
      number: map['number'] as String,
      language: map['language'] as String,
      insult: map['insult'] as String,
      created: map['created'] as String,
    );
  }

  @override
  String toString() {
    return 'Joke{number: $number, language: $language, insult: $insult, created: $created}';
  }
}
