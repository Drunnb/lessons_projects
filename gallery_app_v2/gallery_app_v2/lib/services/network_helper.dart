import 'dart:convert';
import 'package:gallery_app_v2/services/photo_class_json.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({required this.url});
  final String url;

  Future<dynamic> getData() async {
    http.Response response;
    response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      final json = jsonDecode(data) as List<
          dynamic>; // декодируем и сохраняем в переменную как лист динамиков
      final photosList = json
          .map((e) => PhotosClassJson.fromMap(e as Map<String, dynamic>))
          .toList(); // парсим список через модель JSON и сохраняем в новый лист
      // print(photosList[0].urls.raw);
      return photosList;
    } else {
      // print(response.statusCode);
      return;
    }
  }
}
/*


Future <List<Data>> fetchData() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/albums');
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => new Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
*/
