import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/features/create_event/create_event_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventLocation extends StatelessWidget {
  const EventLocation({super.key, required this.provider});
  final CreateEventProvider provider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: provider.cameraPosition,
              onMapCreated: (controller) {
                provider.mapController = controller;
              },
              mapType: MapType.normal,
              markers: provider.markers,
              zoomControlsEnabled: false,
              onTap: (argument) async{
                provider.getEventLocation(argument);
               await provider.convertLatLng();

                Navigator.pop(context);
              },
            ),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            color: ColorsManager.blue,
            padding: REdgeInsets.all(16),
            child: Text(
              "Tap on Location To Select",
              style: GoogleFonts.inter(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: ColorsManager.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
