import 'package:equatable/equatable.dart';

class Project extends Equatable {
  final String id;
  final String name;
  final String description;
  final DateTime? createdDate;

  const Project({
    required this.id,
    required this.name,
    required this.description,
    this.createdDate,
  });

  ///---------To Map and From Map methods---------///
  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      "id": id,
      "name": name,
      "description": description,
      "createdDate": createdDate,
    };
    return data;
  }

  factory Project.fromMap({required Map<String, dynamic> data}) {
    return Project(
        id: data["id"],
        name: data["name"],
        description: data["description"],
        createdDate: data["createdDate"]);
  }

  ///-------CopyWith--------///
  Project copyWith({
    String? id,
    String? name,
    String? description,
    DateTime? createdDate,
  }) {
    return Project(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  ///-------Empty-------///
  static Project empty = const Project(id: "", name: "", description: "");
  bool get isEmpty => this == Project.empty;
  bool get isNotEmpty => this != Project.empty;

  @override
  List<Object?> get props => [id, name, description, createdDate];
}
