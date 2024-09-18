// ignore_for_file: avoid_print

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manger_app/core/domin/model/auth_model/signup_model.dart';
import 'package:manger_app/core/resources/app_assets.dart';
import 'package:manger_app/core/resources/app_color.dart';
import 'package:manger_app/core/resources/app_string.dart';
import 'package:manger_app/feature/auth/bloc/signup_bloc/sign_up_bloc.dart';
import 'package:manger_app/feature/auth/bloc/signup_bloc/sign_up_event.dart';
import 'package:manger_app/feature/auth/bloc/signup_bloc/sign_up_state.dart';
import 'package:manger_app/feature/auth/component/signup_container.dart';
import 'package:manger_app/feature/shares/custom_buttom.dart';
import 'package:manger_app/feature/shares/custom_loading_button.dart';
import 'package:manger_app/feature/shares/custom_sizedbox.dart';

import 'package:manger_app/feature/shares/custom_toast.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
                  if(state is SignUpSuccessState ){
                    
    showTost(message: AppStrings.signupFailed.tr(), state: ToastState.success);
                          // Navigator.of(context).pushReplacementNamed('homescreen');

                  } 
                  else if( state is SignUpErrorState){
                    print('--------------- signupfaild');
    showTost(message: AppStrings.signupFailed.tr(), state: ToastState.error);
    
                  }
                },
        builder: (context, state) {
          var signupbloc = BlocProvider.of<SignUpBloc>(context);
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(36),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox_Height(
                            height: 50.h,
                          ),
                          SignUpContainer(signupbloc: signupbloc),
                          SizedBox_Height(height: 30.h),
                          state is SignUpLoadingState?const Loading():
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.black),
                                  borderRadius: BorderRadius.circular(15)),
                              child: CustomButton(
                                onPressed: () {
                                  if (BlocProvider.of<SignUpBloc>(context)
                                      .signup
                                      .currentState!
                                      .validate()) {
                                    context.read<SignUpBloc>().add(
                                        SignUpSuccess(
                                            signupModel: SignUpModel(
                                                email: signupbloc.emailController.text,
                                                password: signupbloc.passwordController.text,
                                                lastName: signupbloc.lastnameController.text,
                                                role: "USER",
                                                firstName: signupbloc.firstnameController.text)));
                                  }
                                },
                                text: AppStrings.signup.tr(),
                                width: 283.w,
                                height: 39.h,
                              )),
                          SizedBox_Height(height: 10.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.alreadyhaveaccount.tr(),
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            'login', (route) => false);
                                  },
                                  child: Text(
                                    AppStrings.login.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(color: AppColor.secondary),
                                  ))
                            ],
                          )
                        ],
                      ),
                      Positioned(
                          left: 74.w,
                          right: 74.w,
                          top: 0.h,
                          child: SizedBox(
                              height: 110.h,
                              width: 110.w,
                              child: Image.asset(
                                AppAssets.logoForAuth,
                                fit: BoxFit.contain,
                              ))),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

