

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manger_app/core/domin/model/project_model/add_task_for_project_model.dart';
import 'package:manger_app/core/domin/service/project_service.dart';
import 'package:manger_app/feature/order/bloc/add_new_task/add_new_task_event.dart';

import 'add_new_task_state.dart';

class AddNewTaskBloc extends Bloc<AddNewTaskEvent, AddNewTaskState> {
  GlobalKey<FormState>  addtask=GlobalKey<FormState>();
TextEditingController projectname= TextEditingController();
TextEditingController taskDescription = TextEditingController();
int index=1;
 List<AddNewTaskModel> tasks = [];
  AddNewTaskBloc() : super(AddNewTaskInitial()) {
    on<AddNewTaskSuccessEvent>((event, emit)async {
       List<Map> req = [];
      tasks.forEach((element) {
        req.add(element.toMap());
      });
        emit(AddNewTaskLoadingState());
      try{
print('------------- befor task');
      var tasks= await ProjectImpl().addNewTask(req);
      print('----------------------');
  print(tasks);
    
 emit(AddNewTaskSuccessState());
      }catch(e){
        print(e.toString());
         emit(AddNewTaskErrorState());
      }
    });


    //!AddContainerForTask
    on<AddContainerForTask>((event, emit) {

       tasks.add(
        AddNewTaskModel(taskStatus: '', taskDescription: '', project_id: 1));
      emit(AddContainerSuccessState(tasks: tasks));
      taskDescription.clear();
      // index++;
      // emit(AddContainerSuccessState());
    });
   
 // ? to edit prev fake model that we created it to increase list length
    on<SubmitOneTask>((event, emit) {
      tasks.last = event.oneTask;
      emit(OneTaskSubmitd());
emit(AddContainerSuccessState(tasks: tasks));
   taskDescription.clear();
      print(tasks);

    });


    //!dismissible for task
    on<DismissibleTask>((event, emit) {
       if (tasks.isNotEmpty){

      tasks.removeAt(event.index);
       emit(DismissibleTaskSuccessState());
       }
       //index--;
    });
         print(taskDescription.text);
  }

}
