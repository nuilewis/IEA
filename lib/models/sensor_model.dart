import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Sensor extends Equatable {
  final String id;
  final double diameter;
  final GeoPoint? location;

  const Sensor({required this.id, required this.diameter, this.location});

  ///---------To Map and From Map methods---------///
  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      "id": id,
      "diameter": diameter,
      "location": location,
    };
    return data;
  }

  factory Sensor.fromMap({required Map<String, dynamic> data}) {
    return Sensor(
        id: data["id"], diameter: data["diameter"], location: data["location"]);
  }

  ///-------CopyWith--------///
  Sensor copyWith({
    String? id,
    double? diameter,
    GeoPoint? location,
  }) {
    return Sensor(
      id: id ?? this.id,
      diameter: diameter ?? this.diameter,
      location: location ?? this.location,
    );
  }

  ///-------Empty-------///
  static Sensor empty = const Sensor(id: "", diameter: 0);
  bool get isEmpty => this == Sensor.empty;
  bool get isNotEmpty => this != Sensor.empty;

  @override
  List<Object?> get props => [id, diameter, location];
}
