import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapProvider extends ChangeNotifier {
  bool _isDisposed = false;

  MapProvider() {
    getUserLocation();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  Location location = Location();
  late GoogleMapController mapController;
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

  void getUserLocation() async {
    bool isPermissionGranted = await _getUserPermission();
    if (!isPermissionGranted) return;
    if (_isDisposed) return;
    bool isServiceEnabled = await _getServicePermission();
    if (!isServiceEnabled) return;
    LocationData locationData = await location.getLocation();
    if (_isDisposed) return;
    CameraPosition cameraPosition = CameraPosition(
      target: LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0),
      zoom: 16,
    );
    markers.add(
      Marker(
        markerId: MarkerId("1"),
        infoWindow: InfoWindow(title: "My Location"),
        position: LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0)
      ),
    );

    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    notifyListeners();
  }
}
