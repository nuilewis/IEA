import 'package:water_project/services/firebase_base_services.dart';

import '../../models/project_model.dart';

class ProjectFirestoreService extends FirestoreService {
  Future<void> addNewProject(Project project) async {
    Map<String, dynamic> projectData = project.toMap();
    await firestore.collection("project").doc().set(projectData);
  }

  Future<void> editProject({required Project project}) async {
    Map<String, dynamic> projectData = project.toMap();

    await firestore.collection("project").doc().update(projectData);
  }

  ///Delete Project
  Future<void> deleteProject({required Project project}) async {
    await firestore.collection("project").doc(project.id).delete();
  }
}
