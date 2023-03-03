import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController mapscontroller;
  final List<Marker> _markers = [];
  bool showmaps = true;

  @override
  void initState() {
    super.initState();
    _markers.add(const Marker(
      markerId: MarkerId("myLocation"),
      position: LatLng(59.948680, 11.010630),
    ));

    if (_markers.isNotEmpty) {
      setState(() {
        showmaps = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: showmaps
          ? GoogleMap(
              onMapCreated: (controller) {
                setState(() {
                  mapscontroller = controller;
                });
              },
              markers: Set<Marker>.of(_markers),
              mapType: MapType.normal,
              initialCameraPosition: const CameraPosition(
                  target: LatLng(59.948680, 11.010630), zoom: 14))
          : const CircularProgressIndicator(),
    );
  }
}
