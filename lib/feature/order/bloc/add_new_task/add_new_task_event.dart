// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:manger_app/core/domin/model/project_model/add_task_for_project_model.dart';

class AddNewTaskEvent {}
class AddNewTaskSuccessEvent extends AddNewTaskEvent {
 
}
class AddContainerForTask extends AddNewTaskEvent{
  
}
class DismissibleTask extends AddNewTaskEvent {

  int index;
  DismissibleTask({
    required this.index,
  });
}
class SubmitOneTask extends AddNewTaskEvent {
  AddNewTaskModel oneTask;
  SubmitOneTask({
    required this.oneTask,
  });
}