import 'package:flutter/material.dart';
import 'package:water_project/models/sensor_model.dart';

class SensorData extends ChangeNotifier {
  Sensor? sensorData;

  setSensorData(Sensor sensorInfo) {
    sensorData = sensorInfo;
    notifyListeners();
  }

  getSensorDataFromFireStore(Sensor sensorData) {
    notifyListeners();
  }

  updateSensorData(Sensor sensorData) {
    notifyListeners();
  }
}
