import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';

import '../core/connection_checker/connection_checker.dart';
import '../core/errors/failure.dart';
import '../models/project_model.dart';
import '../models/sensor_model.dart';
import '../services/sensors/sensor_firestore_service.dart';
import '../services/sensors/sensor_realtime_db_service.dart';

abstract class SensorRepository {
  Future<Either<Failure, List<Sensor>>> getSensorInformation(
      {required Project project});
  Future<Either<Failure, Stream<DatabaseEvent>>> getSensorFlowRateData(
      Sensor sensor);
}

class SensorRepositoryImplementation implements SensorRepository {
  final SensorFirestoreService sensorFireStoreService;
  final SensorRealtimeDBService sensorRealTimeDatabaseService;
  final ConnectionChecker connectionChecker;

  SensorRepositoryImplementation({
    required this.sensorFireStoreService,
    required this.sensorRealTimeDatabaseService,
    required this.connectionChecker,
  });
  @override
  Future<Either<Failure, Stream<DatabaseEvent>>> getSensorFlowRateData(
      Sensor senor) async {
    if (await connectionChecker.isConnected) {
      try {
        final Stream<DatabaseEvent> flowRateStream =
            await sensorRealTimeDatabaseService.getStreamData("");

        return Right(flowRateStream);
      } on FirebaseException catch (e) {
        return Left(FirebaseFailure(errorMessage: e.message));
      } catch (e) {
        return const Left(FirebaseFailure(
            errorMessage:
                "An error occurred while trying to get the flow rate data"));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Sensor>>> getSensorInformation(
      {required Project project}) async {
    if (await connectionChecker.isConnected) {
      try {
        final QuerySnapshot querySnapshot =
            await sensorFireStoreService.getSensorInfo(project: project);

        List<Sensor> sensorsList = [];
        for (DocumentSnapshot element in querySnapshot.docs) {
          Map<String, dynamic> elementData =
              element.data() as Map<String, dynamic>;

          Sensor sensor = Sensor.fromMap(data: elementData);
          sensorsList.add(sensor);
        }

        return Right(sensorsList);
      } on FirebaseException catch (e) {
        return Left(FirebaseFailure(errorMessage: e.message));
      } catch (e) {
        return const Left(FirebaseFailure(
            errorMessage:
                "An error occurred while trying to get the flow rate data"));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }
}
