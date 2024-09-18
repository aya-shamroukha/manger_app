// ignore_for_file: sort_child_properties_last


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manger_app/core/resources/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, this.height=40, this.width, required this.onPressed, this.background, required this.text, this.textcolor
  });
final double ?height;
final double ?width;
final VoidCallback onPressed;
final Color? background;
final String text;
final Color ?textcolor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height!.h,
     width: width,
      
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith
        (backgroundColor: MaterialStateProperty.all(background??AppColor.grey),),
        child: Text(text,
        style:TextStyle(color:textcolor??AppColor.primary,fontWeight: FontWeight.w300),
      
      ),
      
      onPressed: onPressed,),
    );
  }
}