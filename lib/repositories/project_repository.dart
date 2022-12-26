import 'package:dartz/dartz.dart';
import 'package:water_project/services/projects/project_firestore_service.dart';

import '../core/errors/failure.dart';
import '../models/project_model.dart';

abstract class ProjectRepository {
  Future<Either<Failure, void>> createProject(Project project);
  Future<Either<Failure, void>> updateProject(Project project);
  Future<Either<Failure, void>> deleteProject(Project project);
  Future<Either<Failure, List<Project>>> getProjects();
}

class ProjectRepositoryImplementation implements ProjectRepository {
  final ProjectFirestoreService projectFirestoreService;

  ProjectRepositoryImplementation(this.projectFirestoreService);

  @override
  Future<Either<Failure, void>> createProject(Project project) {
    // TODO: implement createProject
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteProject(Project project) {
    // TODO: implement deleteProject
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Project>>> getProjects() {
    // TODO: implement getProjects
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateProject(Project project) {
    // TODO: implement updateProject
    throw UnimplementedError();
  }
}
