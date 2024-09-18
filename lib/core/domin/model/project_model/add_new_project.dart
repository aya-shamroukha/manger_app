// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddNewProjectModel {
  String projectStatus;
  String projectDescription;
  String projectName;
  AddNewProjectModel({
    required this.projectStatus,
    required this.projectDescription,
    required this.projectName,
  });

  AddNewProjectModel copyWith({
    String? projectStatus,
    String? projectDescription,
    String? projectName,
  }) {
    return AddNewProjectModel(
      projectStatus: projectStatus ?? this.projectStatus,
      projectDescription: projectDescription ?? this.projectDescription,
      projectName: projectName ?? this.projectName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'projectStatus': projectStatus,
      'projectDescription': projectDescription,
      'projectName': projectName,
    };
  }

  factory AddNewProjectModel.fromMap(Map<String, dynamic> map) {
    return AddNewProjectModel(
      projectStatus: map['projectStatus'] as String,
      projectDescription: map['projectDescription'] as String,
      projectName: map['projectName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddNewProjectModel.fromJson(String source) => AddNewProjectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AddNewProjectModel(projectStatus: $projectStatus, projectDescription: $projectDescription, projectName: $projectName)';

  @override
  bool operator ==(covariant AddNewProjectModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.projectStatus == projectStatus &&
      other.projectDescription == projectDescription &&
      other.projectName == projectName;
  }

  @override
  int get hashCode => projectStatus.hashCode ^ projectDescription.hashCode ^ projectName.hashCode;
}
