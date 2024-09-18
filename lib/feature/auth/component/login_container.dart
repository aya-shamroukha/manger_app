import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manger_app/core/resources/app_color.dart';
import 'package:manger_app/core/resources/app_string.dart';
import 'package:manger_app/feature/auth/bloc/login_bloc/log_in_bloc.dart';
import 'package:manger_app/feature/auth/bloc/login_bloc/log_in_event.dart';
import 'package:manger_app/feature/shares/custom_sizedbox.dart';
import 'package:manger_app/feature/shares/custom_text_field.dart';

class LogInContainer extends StatelessWidget {
  const LogInContainer({
    super.key,
    required this.loginbloc,
  });

  final LogInBloc loginbloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288.w,
      height: 360.h,
      decoration: BoxDecoration(
          color: AppColor.grey,
          border: Border.all(color: AppColor.black),
          borderRadius: BorderRadius.circular(20)),
      child: Center(
          child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox_Height(height: 75.h),
          CustomTextfield(text: AppStrings.email.tr(),controller: loginbloc.emailController,
          validate:  (value){
                  if(value!.isEmpty|| !value.contains('@gmail.com')){
                    return AppStrings.valiemail.tr();
                  }else{
                    return null;
                  }
                }, ),
          SizedBox_Height(height: 30.h),
          CustomTextfield(
            obscureText: loginbloc.isSecret,
             suffixicon:IconButton(onPressed: (){
    
              context.read<LogInBloc>().add(IsSecretEvent());
            }, icon: Icon(loginbloc.isSecret? Icons.visibility_off:Icons.visibility,color: AppColor.primary,)),
            
            text: AppStrings.password.tr(),controller: loginbloc.passwordController,
          
          validate:  (value){
                  if(value!.isEmpty){
                    return AppStrings.valiepassword.tr();
                  }else{
                    return null;
                  }
                }
          ),
          SizedBox_Height(height: 20.h),
          Row(
          
            children: [
              SizedBox_width(
                width: 15.w,
              ),
              Checkbox(
                  checkColor: AppColor.primary,
                  hoverColor: AppColor.primary,
                  focusColor: AppColor.primary,
                  value: false,
                  onChanged: (value) {}),
              Text(
                AppStrings.rememberme.tr(),
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: AppColor.primary),
              ),
            ],
          )
        ],
      )),
    );
  }
}
