  import 'package:manger_app/core/domin/model/project_model/add_task_for_project_model.dart';

 
 
 class AddNewTaskState {}

final class AddNewTaskInitial extends AddNewTaskState {}
class AddNewTaskSuccessState extends AddNewTaskState{

 


}
  class AddNewTaskLoadingState extends AddNewTaskState{}
   class AddNewTaskErrorState extends AddNewTaskState{}

    class AddContainerSuccessState extends AddNewTaskState{

       final List<AddNewTaskModel> tasks;

  AddContainerSuccessState({required this.tasks});



 
    }
     class DismissibleTaskSuccessState extends AddNewTaskState{}
  class OneTaskSubmitd extends AddNewTaskState{}