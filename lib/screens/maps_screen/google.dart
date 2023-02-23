import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

 
class maps extends StatefulWidget {
  const maps({super.key});

  @override
  State<maps> createState() => _mapsState();
}

class _mapsState extends State<maps> {
  late GoogleMapController  mapscontroller;
  List<Marker> _markers = [
    
  ];
  bool showmaps = true;

  @override
  void initState(){
    super.initState();
_markers.add(Marker(markerId: MarkerId("myLocation"),
position: LatLng(59.948680, 11.010630),));

   if (_markers.isNotEmpty){
    setState(() {
      showmaps = true;
    });
   }

  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child:showmaps
      ? Container(
        // height: 300,
        // width: 1230,

        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(12),
          
        // ),
        child: GoogleMap(
          onMapCreated: (controller) {
            setState(() {
              mapscontroller = controller;
            });
          },

          markers: Set<Marker>.of(_markers),
          mapType: MapType.normal,
          
          
          initialCameraPosition: CameraPosition(target: LatLng(59.948680, 11.010630), zoom: 14))
      )
      :CircularProgressIndicator(),
    );
  }
}