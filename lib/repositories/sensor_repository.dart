import 'package:dartz/dartz.dart';
import 'package:water_project/models/flow_data_model.dart';

import '../core/errors/failure.dart';
import '../models/sensor_model.dart';
import '../services/sensors/sensor_firestore_service.dart';
import '../services/sensors/sensor_realtime_db_service.dart';

abstract class SensorRepository {
  Future<Either<Failure, List<Sensor>>> getSensorInformation();
  Future<Either<Failure, List<FlowRate>>> getSensorFlowRateData(Sensor sensor);
}

class SensorRepositoryImplementation implements SensorRepository {
  final SensorFirestoreService sensorFireStoreService;
  final SensorRealtimeDBService sensorRealTimeDatabaseService;

  SensorRepositoryImplementation(
      {required this.sensorFireStoreService,
      required this.sensorRealTimeDatabaseService});
  @override
  Future<Either<Failure, List<FlowRate>>> getSensorFlowRateData(Sensor senor) {
    // TODO: implement getSensorFlowRateData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Sensor>>> getSensorInformation() {
    // TODO: implement getSensorInformation
    throw UnimplementedError();
  }
}
