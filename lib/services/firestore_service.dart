import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/sensor_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addSensorInfo({required Sensor sensorInfo}) {
    Map<String, dynamic> sensorDataToAdd = {
      "location": sensorInfo.location,
      "diameter": sensorInfo.diameter,
      "id": sensorInfo.id
    };

    _firestore.collection("sensors").doc().set(sensorDataToAdd);
  }

  updateSensorInfo({required Sensor sensorInfo}) {
    Map<String, dynamic> sensorDataToUpdate = {
      "location": sensorInfo.location,
      "diameter": sensorInfo.diameter,
      "id": sensorInfo.id
    };

    _firestore.collection("sensors").doc().update(sensorDataToUpdate);
  }

  //Get sensor data
  getSensorData(String id) {
    // DocumentSnapshot sensorData = _firestore
    //     .collection("sensors")
    //     .doc().
  }

  ///----------Add a New Water Project----------------///

  addNewProject(String projectName, String description) {
    Map<String, dynamic> projectData = {
      "project_name": projectName,
      "description": description,
      "date": DateTime.now(),
    };
    //Adding a new project
    _firestore.collection(projectName).doc("info").set(projectData);
  }

  editProject(
      {required String projectID,
      required String projectName,
      required String description}) {
    Map<String, dynamic> projectDataUpdate = {
      "project_name": projectName,
      "description": description,
      "date": DateTime.now(),
    };

    ///Update Project
    _firestore.collection(projectName).doc("info").update(projectDataUpdate);
  }

  ///Delete Project

  deleteProject({required String projectID, required String projectName}) {
    _firestore.collection(projectName).doc("info").delete();
    _firestore.collection(projectName).doc("sensors").delete();
  }
}
