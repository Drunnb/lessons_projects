import 'dart:convert';

List<PhotosClassJson> photosClassJsonFromMap(String str) =>
    List<PhotosClassJson>.from(
        json.decode(str).map((x) => PhotosClassJson.fromMap(x)));

String photosClassJsonToMap(List<PhotosClassJson> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class PhotosClassJson {
  PhotosClassJson({
    required this.urls,
  });

  Urls urls;

  factory PhotosClassJson.fromMap(Map<String, dynamic> json) => PhotosClassJson(
        urls: Urls.fromMap(json["urls"]),
      );

  Map<String, dynamic> toMap() => {
        "urls": urls.toMap(),
      };
}

class Urls {
  Urls({
    required this.smallS3,
  });

  String smallS3;

  factory Urls.fromMap(Map<String, dynamic> json) => Urls(
        smallS3: json["small_s3"],
      );

  Map<String, dynamic> toMap() => {
        "small_s3": smallS3,
      };
}
