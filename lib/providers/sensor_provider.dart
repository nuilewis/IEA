import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:water_project/models/sensor_model.dart';
import 'package:water_project/repositories/sensor_repository.dart';

import '../core/errors/failure.dart';
import '../models/flow_data_model.dart';

enum SensorState { initial, submitting, success, error }

class SensorProvider extends ChangeNotifier {
  SensorRepository sensorRepository;
  String errorMessage = "";
  List<Sensor> allSensors = [];
  List<FlowRate> flowRateData = [];
  FlowRate? flowData;
  SensorState state = SensorState.initial;

  SensorProvider({required this.sensorRepository});

  Future<void> getSensors() async {
    Either<Failure, List<Sensor>> response =
        await sensorRepository.getSensorInformation();

    response.fold((failure) {
      errorMessage = failure.errorMessage ??
          "An error occurred while getting the sensor info";
      state = SensorState.error;
    }, (sensors) {
      allSensors = sensors;
      state = SensorState.success;
    });

    notifyListeners();
  }

  Future<void> getSensorData(Sensor sensor) async {
    Either<Failure, List<FlowRate>> response =
        await sensorRepository.getSensorFlowRateData(sensor);

    response.fold((failure) {
      errorMessage = failure.errorMessage ??
          "An error occurred while getting the sensor flow rate data";
      state = SensorState.error;
    }, (flowRate) {
      flowRateData = flowRate;
      state = SensorState.success;
    });

    notifyListeners();
  }
}
