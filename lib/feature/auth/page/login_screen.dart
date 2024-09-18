import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manger_app/core/domin/model/auth_model/login_model.dart';
import 'package:manger_app/core/resources/app_assets.dart';
import 'package:manger_app/core/resources/app_color.dart';
import 'package:manger_app/core/resources/app_string.dart';
import 'package:manger_app/feature/auth/bloc/login_bloc/log_in_bloc.dart';
import 'package:manger_app/feature/auth/bloc/login_bloc/log_in_event.dart';
import 'package:manger_app/feature/auth/bloc/login_bloc/log_in_state.dart';
import 'package:manger_app/feature/auth/component/login_container.dart';
import 'package:manger_app/feature/shares/custom_buttom.dart';
import 'package:manger_app/feature/shares/custom_sizedbox.dart';
import 'package:manger_app/feature/shares/custom_toast.dart';

import '../../shares/custom_loading_button.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInBloc(),
      child: BlocConsumer<LogInBloc, LogInState>(
        listener: (context, state) {
          //               if(state is LogInSuccessState ){

          // showTost(message: AppStrings.loginSucessfully.tr(), state: ToastState.success);
          //                       Navigator.of(context).pushReplacementNamed('createProjectScreen');
          //               }
          //               else if( state is LogInErrorState){
          //                 print('--------------- loginfaild');
          // showTost(message: AppStrings.loginFailed.tr(), state: ToastState.error);
          //               }
          //             },
        },
        builder: (context, state) {
          var loginbloc = BlocProvider.of<LogInBloc>(context);
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(36),
                  child: Stack(
                    children: [
                      Form(
                        key: loginbloc.login,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox_Height(
                              height: 90.h,
                            ),
                            LogInContainer(loginbloc: loginbloc),
                            SizedBox_Height(height: 30.h),
                            state is LogInLoadingState
                                ? const Loading()
                                : Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: AppColor.black),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: CustomButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                'createProjectScreen');

                                        //  if (BlocProvider.of<LogInBloc>(context).login.currentState!.validate()) {
                                        //               context.read<LogInBloc>().add(
                                        //                   LogInSuccess(
                                        //                       logInModel: LogInModel(
                                        //                           email: loginbloc.emailController.text,
                                        //                           password: loginbloc.passwordController.text,
                                        //                          )));
                                        //             }
                                      },
                                      text: AppStrings.login.tr(),
                                      width: 283.w,
                                      height: 39.h,
                                    )),
                            SizedBox_Height(height: 10.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppStrings.donthaveaccount.tr(),
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              'signup', (route) => false);
                                    },
                                    child: Text(
                                      AppStrings.signup.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(color: AppColor.secondary),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(
                          left: 74.w,
                          right: 74.w,
                          top: 40.h,
                          child: SizedBox(
                              height: 120.h,
                              width: 120.w,
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
