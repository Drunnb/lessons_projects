import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:stb_v1/bloc/location_cubit.dart';

// ignore: use_key_in_widget_constructors
class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationCubit, LocationState>(
        builder: ((context, state) {
          if (state is LocationLoaded) {
            return FlutterMap(
              options: MapOptions(
                center: LatLng(state.latitude, state.longitude),
                zoom: 15.3,
                maxZoom: 17,
                minZoom: 3.5,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                  retinaMode: true,
                ),
              ],
            );
          }
          if (state is LocationError) {
            return Center(
              child: MaterialButton(
                  child: const Text('Try again'),
                  onPressed: () {
                    context.read<LocationCubit>().getLocation;
                  }),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
