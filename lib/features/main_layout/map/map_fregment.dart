import 'package:evently_app/features/main_layout/map/display_events/display_events.dart';
import 'package:evently_app/features/main_layout/map/map_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapFregment extends StatelessWidget {
  const MapFregment({super.key});

  @override
  Widget build(BuildContext context) {
    MapProvider provider = Provider.of<MapProvider>(context);
    return Scaffold(
      body: Stack(
       
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: provider.cameraPosition,
              onMapCreated: (controller) {
                provider.mapController = controller;
              },
              markers: provider.markers,
            ),
          ),
          Padding(
            padding:  REdgeInsets.only(bottom: 120),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                height: 100,
                child: DisplayEvents()),
            ),
          ),
        ],
      ),
    );
  }
}
