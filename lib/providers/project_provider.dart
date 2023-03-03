import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../core/errors/failure.dart';
import '../models/project_model.dart';
import '../repositories/project_repository.dart';

enum ProjectState { initial, submitting, success, error }

class ProjectProvider extends ChangeNotifier {
  ProjectRepository projectRepository;
  String errorMessage = "";
  List<Project> allProjects = [];
  ProjectState state = ProjectState.initial;

  ProjectProvider({required this.projectRepository});

  Future<void> getProjects() async {
    Either<Failure, List<Project>> response =
        await projectRepository.getProjects();

    response.fold((failure) {
      errorMessage = failure.errorMessage ??
          "An error occurred while getting your projects";
      state = ProjectState.error;
    }, (projects) {
      allProjects = projects;
      state = ProjectState.success;
    });

    notifyListeners();
  }

  Future<void> updateProject(Project project) async {
    Either<Failure, void> response =
        await projectRepository.updateProject(project);

    response.fold((failure) {
      errorMessage = failure.errorMessage ??
          "An error occurred while trying to update the project";
      state = ProjectState.error;
    }, (nothing) {
      state = ProjectState.success;
    });

    notifyListeners();
  }

  Future<void> deleteProject(Project project) async {
    Either<Failure, void> response =
        await projectRepository.deleteProject(project);

    response.fold((failure) {
      errorMessage = failure.errorMessage ??
          "An error occurred while trying to delete the project";
      state = ProjectState.error;
    }, (nothing) {
      state = ProjectState.success;
    });

    notifyListeners();
  }

  Future<void> createProject(Project project) async {
    Either<Failure, void> response =
        await projectRepository.createProject(project);

    response.fold((failure) {
      errorMessage = failure.errorMessage ??
          "An error occurred while trying to create your project";
      state = ProjectState.error;
    }, (nothing) {
      state = ProjectState.success;
    });

    notifyListeners();
  }
}
