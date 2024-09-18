
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domin/service/auth_service.dart';
import 'log_in_event.dart';
import 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  GlobalKey<FormState> login=GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
TextEditingController emailController = TextEditingController();
bool isSecret=true;

  LogInBloc() : super(LogInInitial()) {
    on<LogInSuccess>((event, emit) async{
      emit(LogInLoadingState());
      final isSuccess = await AuthImpl().login(event.logInModel);
      print('-------------------------');
      print(isSuccess);
     if(isSuccess==true){
    emit(LogInSuccessState());
}
else{
  emit(LogInErrorState());
}
    
    });
    
    on<IsSecretEvent>((event, emit) {

      isSecret= !isSecret;
      emit(IsSecretSuccessState());
    });
  }
}
