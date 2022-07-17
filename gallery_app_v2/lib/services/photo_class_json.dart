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
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  String raw;
  String full;
  String regular;
  String small;
  String thumb;
  String smallS3;

  factory Urls.fromMap(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
        smallS3: json["small_s3"],
      );

  Map<String, dynamic> toMap() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
        "small_s3": smallS3,
      };
}
