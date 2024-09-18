import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manger_app/core/resources/app_color.dart';


class CustomTextfield extends StatelessWidget {
  
    // ignore: prefer_const_constructors_in_immutables
    CustomTextfield({
    super.key,
    this.validate,
      this.controller, this.suffixicon,  this.readonly=false, required this.text, this.obscureText=false, this.textFieldcolor, this.labelcolor,
  });
 
 final Color ?labelcolor;
    final String text;
  final TextEditingController? controller;
final dynamic validate;
final IconButton?suffixicon;
final bool obscureText;
final bool readonly;
final Color? textFieldcolor;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setstate) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom:5.0),
              child: Text(text,style: Theme.of(context).textTheme.displaySmall!.copyWith(color:textFieldcolor?? AppColor.labelcolor),),
            ),
            TextFormField(
              style: TextStyle(fontSize: 13.sp, color:labelcolor?? AppColor.labelcolor),
         //  keyboardType:textInputType ,
              validator: validate,
              obscureText: obscureText,
               autovalidateMode: AutovalidateMode.onUserInteraction,
        readOnly: readonly,
              controller: controller,
              cursorColor: AppColor.labelcolor,
              
              decoration: InputDecoration(
                errorBorder: 
                Theme.of(context).inputDecorationTheme.errorBorder,
                focusedBorder:
                    Theme.of(context).inputDecorationTheme.focusedBorder,
                enabledBorder:
                    Theme.of(context).inputDecorationTheme.enabledBorder,
              
                suffixIcon: suffixicon
               
              ),
            ),
          ],
        ),
      );
    });
  }
}