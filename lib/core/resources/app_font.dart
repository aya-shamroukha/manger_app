import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manger_app/core/resources/app_color.dart';

TextStyle textStyle(
    {required Color color,
    required double fontsize,
    required FontWeight fontWeight}) {
  return GoogleFonts.inter(
    color: color,
    fontSize:fontsize.sp,
    fontWeight:fontWeight
    );
}
//bold style
TextStyle boldStyle(  
  { Color color=AppColor.white,
     double fontsize=40,
    })=> textStyle(color: color, 
fontsize: fontsize, 
fontWeight: FontWeight.bold);
//regular style
TextStyle regularStyle(  
  { Color color=Colors.white,
     double fontsize=30,
    })=> textStyle(color: color, 
fontsize: fontsize, 
fontWeight: FontWeight.normal);
//normal Style
TextStyle normalStyle(  
  { Color color=Colors.white,
     double fontsize=15,
     FontWeight fontweight=FontWeight.w300,
   
    })=> textStyle(color: color, 
fontsize: fontsize, 
fontWeight: fontweight);