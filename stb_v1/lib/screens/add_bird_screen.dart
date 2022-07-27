import 'dart:io';

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class AddBirdScreen extends StatefulWidget {
  final LatLng latLng;
  final File image;
  AddBirdScreen({required this.latLng, required this.image});

  @override
  State<AddBirdScreen> createState() => _AddBirdScreenState();
}

class _AddBirdScreenState extends State<AddBirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${widget.latLng.latitude} ${widget.latLng.longitude}'),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
