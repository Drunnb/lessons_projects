import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// ignore: use_key_in_widget_constructors
class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(0, 0),
          zoom: 15.3,
          maxZoom: 17,
          minZoom: 3.5,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
            retinaMode: true,
          ),
        ],
      ),
    );
  }
}
