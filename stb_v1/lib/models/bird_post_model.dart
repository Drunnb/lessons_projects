import 'dart:io';

class BirdModel {
  // we need it for sqflite
  int? id;
  final String? birdName;
  final double latitude;
  final double longitude;
  final String? birdDescriprion;
  final File image;

  BirdModel({
    this.id,
    required this.birdName,
    required this.latitude,
    required this.longitude,
    required this.birdDescriprion,
    required this.image,
  });
}
