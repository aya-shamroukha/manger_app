// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:manger_app/core/domin/model/project_model/add_new_project.dart';

class AddNewProjectEvent {}
class AddNewProjectSuccessEvent extends AddNewProjectEvent {
  AddNewProjectModel addNewProjectModel;
  AddNewProjectSuccessEvent({
    required this.addNewProjectModel,
  });
}
