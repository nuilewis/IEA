import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:water_project/services/firebase_base_services.dart';

import '../../models/project_model.dart';
import '../../models/sensor_model.dart';

class SensorFirestoreService extends FirestoreService {
  Future<void> uploadSensorInfo({
    required Sensor sensor,
    required Project project,
  }) async {
    Map<String, dynamic> sensorData = sensor.toMap();

    ///Todo: think hard about this databse schema
    await firestore
        .collection("project")
        .doc(project.id)
        .collection("sensor")
        .doc()
        .set(sensorData);
  }

  Future<void> updateSensorInfo(
      {required Sensor sensor, required Project project}) async {
    Map<String, dynamic> sensorData = sensor.toMap();

    ///Todo: think hard about this databse schema
    await firestore
        .collection("project")
        .doc(project.id)
        .collection("sensor")
        .doc(sensor.id)
        .update(sensorData);
  }

  Future<QuerySnapshot> getSensorInfo({required Project project}) async {
    ///Todo: think hard about this databse schema
    return await firestore
        .collection("project")
        .doc(project.id)
        .collection("sensor")
        .get();
  }
}
