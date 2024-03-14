import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
  static const LatLng _pGooglePlex = LatLng(22.7180, 75.8333);
  static const LatLng _pRanjeetHanuman = LatLng(22.6997539, 75.8332616);
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: MapPage._pGooglePlex,
        zoom: 10,
      ),
      markers: {
        const Marker(
            markerId: MarkerId("_currentLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: MapPage._pGooglePlex),
        const Marker(
            markerId: MarkerId("_sourceLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: MapPage._pRanjeetHanuman)
      },
    ));
  }
}
