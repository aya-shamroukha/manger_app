

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manger_app/core/domin/service/auth_service.dart';

import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  GlobalKey<FormState> signup=GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController firstnameController = TextEditingController();
TextEditingController lastnameController = TextEditingController();
bool isSecret=true;
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpSuccess>((event, emit) async{
      emit(SignUpLoadingState());
      final isSuccess = await AuthImpl().signup(event.signupModel);
      print('-------------------------');
      print(isSuccess);
     if(isSuccess==true){
    emit(SignUpSuccessState());
}
else{
  emit(SignUpErrorState());
}
    
    });

    on<IsSecretEvent>((event, emit) {

      isSecret= !isSecret;
      emit(IsSecretSuccessState());
    });
  }
}
