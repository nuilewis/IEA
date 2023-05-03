import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:water_project/models/sensor_model.dart';
import 'package:water_project/repositories/sensor_repository.dart';

import '../core/enums/app_state_enum.dart';
import '../core/errors/failure.dart';
import '../models/flow_data_model.dart';
import '../models/project_model.dart';

enum SensorState { initial, submitting, success, error }

class SensorProvider extends ChangeNotifier {
  SensorRepository sensorRepository;
  String errorMessage = "";
  List<Sensor> allSensors = [];
  List<FlowRate> flowRateData = [];
  FlowRate? flowData;
AppState state = AppState.initial;
  SensorProvider({required this.sensorRepository});

  Future<void> getSensors({required Project project}) async {
    Either<Failure, List<Sensor>> response =
        await sensorRepository.getSensorInformation(project: project);

    response.fold((failure) {
      errorMessage = failure.errorMessage ??
          "An error occurred while getting the sensor info";
      state = AppState.error;
    }, (sensors) {
      allSensors = sensors;
      state = AppState.success;
    });

    notifyListeners();
  }

  Future<void> getSensorData(Sensor sensor) async {
    Either<Failure, Stream<DatabaseEvent>> response =
        await sensorRepository.getSensorFlowRateData(sensor);

    response.fold((failure) {
      errorMessage = failure.errorMessage ??
          "An error occurred while getting the sensor flow rate data";
      state = AppState.error;
    }, (flowRateStream) {
      flowRateStream.listen((event) {
        ///Todo: find out how to extract both the velocity of water, and date time of the log from the stream
        FlowRate flowRate = FlowRate(flowRate: event.snapshot.value as double);
        flowRateData.add(flowRate);
      });
      state = AppState.success;
    });

    notifyListeners();
  }
}
