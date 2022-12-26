import 'package:water_project/services/firebase_base_services.dart';

import '../../models/sensor_model.dart';

class SensorFirestoreService extends FirestoreService {
  Future<void> uploadSensorInfo({required Sensor sensor}) async {
    Map<String, dynamic> sensorData = sensor.toMap();

    ///Todo: think hard about this databse schema
    await firestore
        .collection("project")
        .doc("projectId")
        .collection("sensor")
        .doc()
        .set(sensorData);
  }

  Future<void> updateSensorInfo({required Sensor sensor}) async {
    Map<String, dynamic> sensorData = sensor.toMap();

    ///Todo: think hard about this databse schema
    await firestore
        .collection("project")
        .doc("projectId")
        .collection("sensor")
        .doc(sensor.id)
        .update(sensorData);
  }
}
