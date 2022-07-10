class FlowRate {
  final double flowRate;
  final double? velocity;
  final String? sensorID;
  final DateTime? timeStamp;

  FlowRate({required this.flowRate, this.velocity, this.sensorID, this.timeStamp});

  factory FlowRate.fromJson(Map<String, dynamic> json){
    return FlowRate(flowRate: json["Flow Rate"], velocity: json["Velocity"], timeStamp: DateTime.now());
  }
}
