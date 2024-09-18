// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class AddNewTaskModel {
String taskStatus;
  String taskDescription;
  dynamic project_id;
  AddNewTaskModel({
    required this.taskStatus,
    required this.taskDescription,
    required this.project_id,
  });

  AddNewTaskModel copyWith({
    String? taskStatus,
    String? taskDescription,
    dynamic project_id,
  }) {
    return AddNewTaskModel(
      taskStatus: taskStatus ?? this.taskStatus,
      taskDescription: taskDescription ?? this.taskDescription,
      project_id: project_id ?? this.project_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'taskStatus': taskStatus,
      'taskDescription': taskDescription,
      'project_id': project_id,
    };
  }

  factory AddNewTaskModel.fromMap(Map<String, dynamic> map) {
    return AddNewTaskModel(
      taskStatus: map['taskStatus'] as String,
      taskDescription: map['taskDescription'] as String,
      project_id: map['project_id'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddNewTaskModel.fromJson(String source) => AddNewTaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AddNewTaskModel(taskStatus: $taskStatus, taskDescription: $taskDescription, project_id: $project_id)';

  @override
  bool operator ==(covariant AddNewTaskModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.taskStatus == taskStatus &&
      other.taskDescription == taskDescription &&
      other.project_id == project_id;
  }

  @override
  int get hashCode => taskStatus.hashCode ^ taskDescription.hashCode ^ project_id.hashCode;
}
