import 'package:equatable/equatable.dart';

class FlowRate extends Equatable {
  final double flowRate;
  final double? velocity;
  final String? sensorID;
  final DateTime? time;

  const FlowRate(
      {required this.flowRate, this.velocity, this.sensorID, this.time});

  ///---------To Map and From Map methods---------///
  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      "flowRate": flowRate,
      "velocity": velocity,
      "sensorId": sensorID,
      "time": time,
    };
    return data;
  }

  factory FlowRate.fromMap(Map<String, dynamic> data) {
    return FlowRate(
        flowRate: data["flowRate"],
        velocity: data["velocity"],
        time: data["time"]);
  }

  ///-------CopyWith--------///
  FlowRate copyWith({
    double? flowRate,
    double? velocity,
    String? sensorID,
    DateTime? time,
  }) {
    return FlowRate(
      flowRate: flowRate ?? this.flowRate,
      velocity: velocity ?? this.velocity,
      sensorID: sensorID ?? this.sensorID,
      time: time ?? this.time,
    );
  }

  ///-------Empty-------///
  static FlowRate empty =
      FlowRate(flowRate: 0, velocity: 0, sensorID: "", time: DateTime.now());
  bool get isEmpty => this == FlowRate.empty;
  bool get isNotEmpty => this != FlowRate.empty;

  @override
  List<Object?> get props => [flowRate, velocity, sensorID, time];
}
