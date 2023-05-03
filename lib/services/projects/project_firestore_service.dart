import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:water_project/services/firebase_base_services.dart';

import '../../models/project_model.dart';

const String projectPath = "project";

class ProjectFirestoreService extends FirestoreService {


  Future<void> addNewProject(Project project) async {
    Map<String, dynamic> projectData = project.toMap();
    await firestore.collection(projectPath).doc().set(projectData);
  }

  Future<void> updateProject({required Project project}) async {
    Map<String, dynamic> projectData = project.toMap();

    await firestore.collection(projectPath).doc().update(projectData);
  }

  Future<QuerySnapshot> getProjects() async {
    return await firestore.collection(projectPath).get();
  }

  ///Delete Project
  Future<void> deleteProject({required Project project}) async {
    await firestore.collection(projectPath).doc(project.id).delete();
  }
}
