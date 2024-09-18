

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manger_app/core/domin/service/project_service.dart';
import 'package:manger_app/feature/order/bloc/add_new_project_bloc/add_new_project_event.dart';
import 'package:manger_app/feature/order/bloc/add_new_project_bloc/add_new_project_state.dart';

class AddNewProjectBloc extends Bloc<AddNewProjectEvent, AddNewProjectState> {
   GlobalKey<FormState>  addprojects=GlobalKey<FormState>();
  TextEditingController projectname= TextEditingController();
TextEditingController projectDescription = TextEditingController();

  AddNewProjectBloc() : super(AddNewProjectInitial()) {
    on<AddNewProjectSuccessEvent>((event, emit) async{
    emit(AddNewProjectLoadingState());
      try{

      var projects= await ProjectImpl().addNewProject(event.addNewProjectModel);
      print('----------------------');
  print(projects);
      // AddNewProjectModel addproject=
      //    AddNewProjectModel.fromMap((projects));
 emit(AddNewProjectSuccessState(projectId: projects['id']));
      }catch(e){
        print(e.toString());
         emit(AddNewProjectErrorState());
      }
    });
  }
}
