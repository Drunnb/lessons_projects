import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:stb_v1/bloc/location_cubit.dart';
import 'package:stb_v1/screens/add_bird_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

// ignore: use_key_in_widget_constructors
class MapScreen extends StatelessWidget {
  final MapController _mapController = MapController();
  Future<void> _pickImageAndCreatePost(
      {required LatLng latLng, required BuildContext context}) async {
    File? image;
    final picker = ImagePicker();
    final pickFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 40);
    if (pickFile != null) {
      image = File(pickFile.path);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddBirdScreen(
                latLng: latLng,
                image: image!,
              )));
    } else {
      print('User didn`t pick file');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LocationCubit, LocationState>(
        listener: (previousState, currentState) {
          if (currentState is LocationLoaded) {
            _mapController.onReady.then((_) => _mapController.move(
                LatLng(currentState.latitude, currentState.longitude), 14));
          }
          if (currentState is LocationError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.red.withOpacity(0.6),
              content: const Text('Error, unable to fetch location ...'),
            ));
          }
        },
        child: FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            onLongPress: ((tapPosition, point) =>
                _pickImageAndCreatePost(latLng: point, context: context)),
            // onLongPress: (tapPosition, point) {
            //   // Navigator.of(context).push(
            //   //   MaterialPageRoute(
            //   //     builder: (context) => AddBirdScreen(
            //   //       latLng: point,image:,
            //   //     ),
            //   //   ),
            //   // );
            // },
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
      ),
    );
  }
}
