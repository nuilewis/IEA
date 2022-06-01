import 'package:cloud_firestore/cloud_firestore.dart';

class Sensor {
  final String id;
  final double sensorDiameter;
  final GeoPoint? location;

  Sensor({required this.id, required this.sensorDiameter, this.location});
}
