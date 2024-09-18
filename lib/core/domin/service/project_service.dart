// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:manger_app/core/domin/model/project_model/add_new_project.dart';

abstract class ProjectsService {
  addNewProject(AddNewProjectModel addNewProject);
  addNewTask(addNewTaskModel);
}

class ProjectImpl extends ProjectsService {
  @override
  addNewProject(addNewProject) async {
    Dio dio = Dio();
    Response response = await dio.post(
        'https://projects-management-system.onrender.com/api/v1/projects',
        data: addNewProject.toJson(),
        options: Options(headers: {
          "Content-Type": "application/json",
          'accept': ' */*',
          "Authorization":
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaHM4OTk1MDVAZ21haWwuY29tIiwiaWF0IjoxNzE2ODMxOTIzLCJleHAiOjE3MTc0MzY3MjN9.9oSS1pKbZXLsD-5lid5xbqjNY2lxcuW9PSvI1E9w9_E',
        }));

    if (response.statusCode == 200) {
      print('trueeeeeeeeeee');

      return response.data;
    } else {
      print('falseeeee');

      return 'false';
    }
  }

  @override
  addNewTask(addNewTaskModel) async {
    Dio dio = Dio();
    Response response = await dio.post(
        'https://projects-management-system.onrender.com/api/v1/tasks',
        data: addNewTaskModel,
        options: Options(headers: {
          "Content-Type": "application/json",
          'accept': ' */*',
          "Authorization":
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaHM4OTk1MDVAZ21haWwuY29tIiwiaWF0IjoxNzE2ODMxOTIzLCJleHAiOjE3MTc0MzY3MjN9.9oSS1pKbZXLsD-5lid5xbqjNY2lxcuW9PSvI1E9w9_E',
        }));
    if (response.statusCode == 200) {
      print('trueeeeeeeeeee');

      return response.data;
    } else {
      print('falseeeee');

      return 'false';
    }
  }
}
