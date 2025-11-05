import 'package:evently_app/features/main_layout/map/map_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapFregment extends StatelessWidget {
  const MapFregment({super.key});

  @override
  Widget build(BuildContext context) {
    MapProvider provider = Provider.of<MapProvider>(context);
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: provider.cameraPosition,
        onMapCreated: (controller) {
          provider.mapController = controller;
        },
        markers: provider.markers,
      ),
    );
  }
}
