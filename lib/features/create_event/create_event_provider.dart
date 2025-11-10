import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class CreateEventProvider extends ChangeNotifier {
  CreateEventProvider() {
    getUserLocation();
  }
  Location location = Location();
  GoogleMapController? mapController;
  CameraPosition cameraPosition = CameraPosition(
    target: LatLng(37.4220541, -122.0853242),

    zoom: 17,
  );
  Set<Marker> markers = {};
  Future<bool> _getUserPermission() async {
    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }
    return permissionStatus == PermissionStatus.granted;
  }

  _getServicePermission() async {
    bool isServiceEnabled = await location.serviceEnabled();
    if (isServiceEnabled == false) {
      location.requestPermission();
    }
    return isServiceEnabled;
  }

  LatLng? position;
  void getEventLocation(LatLng latLng) {
    position = latLng;
    cameraPosition = CameraPosition(target: latLng, zoom: 16);
    markers.clear();
    markers.add(
      Marker(
        markerId: MarkerId("eventLocation"),
        infoWindow: InfoWindow(title: "Event Location"),
        position: latLng,
      ),
    );
    mapController!.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
    notifyListeners();
  }

  String? convertedLocation;
  Future<void> convertLatLng() async {
    List<geocoding.Placemark> placemarks = await geocoding
        .placemarkFromCoordinates(
          position?.latitude ?? 0,
          position?.longitude ?? 0,
        );
    if (placemarks.isNotEmpty) {
      geocoding.Placemark place = placemarks.first;
      convertedLocation = "${place.country},${place.locality}";
    }
    notifyListeners();
  }

  void getUserLocation() async {
    bool isPermissionGranted = await _getUserPermission();
    if (!isPermissionGranted) return;
    bool isServiceEnabled = await _getServicePermission();
    if (!isServiceEnabled) return;
    LocationData locationData = await location.getLocation();
    cameraPosition = CameraPosition(
      target: LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0),
      zoom: 16,
    );

    markers.add(
      Marker(
        markerId: MarkerId("1"),
        infoWindow: InfoWindow(title: "My Location"),
        position: LatLng(
          locationData.latitude ?? 0,
          locationData.longitude ?? 0,
        ),
      ),
    );

    if (mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newCameraPosition(cameraPosition),
      );
    } else {
      return;
    }
    notifyListeners();
  }
}
