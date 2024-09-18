import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manger_app/core/resources/app_string.dart';

import 'package:manger_app/feature/auth/bloc/signup_bloc/sign_up_bloc.dart';
import 'package:manger_app/feature/auth/bloc/signup_bloc/sign_up_event.dart';
import 'package:manger_app/feature/shares/custom_sizedbox.dart';
import 'package:manger_app/feature/shares/custom_text_field.dart';

import '../../../core/resources/app_color.dart';

class SignUpContainer extends StatelessWidget {
  const SignUpContainer({
    super.key,
    required this.signupbloc,
  });

  final SignUpBloc signupbloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288.w,
      height: 448.h,
      decoration: BoxDecoration(
          color: AppColor.grey,
          border: Border.all(color: AppColor.black),
          borderRadius: BorderRadius.circular(20)),
      child: Center(
          child: Form(
        key: signupbloc.signup,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox_Height(height: 75.h),
              CustomTextfield(text: AppStrings.firstName.tr(),controller: signupbloc.firstnameController,),
              CustomTextfield(text: AppStrings.lastName.tr(),controller: signupbloc.lastnameController,),
              CustomTextfield(text: AppStrings.email.tr(),controller: signupbloc.emailController,
              validate:  (value){
                 if(value!.isEmpty|| !value.contains('@gmail.com')){
                   return AppStrings.valiemail;
                  }else{
                    return null;
                  }
                }
              
              ),
              CustomTextfield(
                obscureText:signupbloc.isSecret ,
                suffixicon:IconButton(onPressed: (){
          
                  context.read<SignUpBloc>().add(IsSecretEvent());
                }, icon: Icon(signupbloc.isSecret? Icons.visibility_off:Icons.visibility,color: AppColor.primary,)),
                text: AppStrings.password.tr(),controller: signupbloc.passwordController,
              validate:  (value){
                 if(value!.isEmpty){
                   return AppStrings.valiepassword.tr();
                 }else{
                   return null;
                 }
               }),
              SizedBox_Height(height: 20.h),
              // Row(
              //   children: [
              //     SizedBox_width(
              //       width: 10.w,
              //     ),
              //     Checkbox(
              //         checkColor: AppColor.primary,
              //         hoverColor: AppColor.primary,
              //         focusColor: AppColor.primary,
              //         value: false,
              //         onChanged: (value) {}),
              //     Text(
              //       AppStrings.rememberme,
              //       style: Theme.of(context)
              //           .textTheme
              //           .displaySmall!
              //           .copyWith(color: AppColor.primary),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      )),
    );
  }
}
