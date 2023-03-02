import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:water_project/services/projects/project_firestore_service.dart';

import '../core/connection_checker/connection_checker.dart';
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
  final ConnectionChecker connectionChecker;

  ProjectRepositoryImplementation(
      {required this.projectFirestoreService, required this.connectionChecker});

  @override
  Future<Either<Failure, void>> createProject(Project project) async {
    if (await connectionChecker.isConnected) {
      try {
        await projectFirestoreService.addNewProject(project);
        return const Right(null);
      } on FirebaseException catch (e) {
        return Left(FirebaseFailure(errorMessage: e.message));
      } catch (e) {
        return const Left(FirebaseFailure(
            errorMessage:
                "An unknown error occurred while trying to create a project"));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteProject(Project project) async {
    if (await connectionChecker.isConnected) {
      try {
        await projectFirestoreService.deleteProject(project: project);
        return const Right(null);
      } on FirebaseException catch (e) {
        return Left(FirebaseFailure(errorMessage: e.message));
      } catch (e) {
        return const Left(FirebaseFailure(
            errorMessage:
                "An unknown error occurred while trying to delete the project"));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Project>>> getProjects() async {
    if (await connectionChecker.isConnected) {
      try {
        final QuerySnapshot querySnapshot =
            await projectFirestoreService.getProjects();

        if (querySnapshot.docs.isNotEmpty) {
          List<Project> gottenProjects = [];

          for (DocumentSnapshot element in querySnapshot.docs) {
            final Map<String, dynamic> elementData =
                element.data() as Map<String, dynamic>;
            Project project = Project.fromMap(data: elementData);
            gottenProjects.add(project);
          }
          return Right(gottenProjects);
        } else {
          return const Left(FirebaseFailure(
              errorMessage: "There are no projects at the moment"));
        }
      } on FirebaseException catch (e) {
        return Left(FirebaseFailure(errorMessage: e.message));
      } catch (e) {
        return const Left(FirebaseFailure(
            errorMessage:
                "An unknown error occurred while trying to get projects"));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateProject(Project project) async {
    if (await connectionChecker.isConnected) {
      try {
        await projectFirestoreService.updateProject(project: project);
        return const Right(null);
      } on FirebaseException catch (e) {
        return Left(FirebaseFailure(errorMessage: e.message));
      } catch (e) {
        return const Left(FirebaseFailure(
            errorMessage:
                "An unknown error occurred while trying to update the project"));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }
}
