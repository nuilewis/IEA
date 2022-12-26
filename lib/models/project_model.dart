import 'package:equatable/equatable.dart';

class Project extends Equatable {
  final String id;
  final String name;
  final String description;

  const Project(
      {required this.id, required this.name, required this.description});

  ///---------To Map and From Map methods---------///
  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      "id": id,
      "name": name,
      "description": description,
    };
    return data;
  }

  factory Project.fromMap({required Map<String, dynamic> data}) {
    return Project(
        id: data["id"], name: data["name"], description: data["description"]);
  }

  ///-------Empty-------///
  static Project empty = const Project(id: "", name: "", description: "");
  bool get isEmpty => this == Project.empty;
  bool get isNotEmpty => this != Project.empty;

  @override
  List<Object?> get props => [id, name, description];
}
