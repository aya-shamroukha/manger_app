import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manger_app/core/resources/app_assets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/config/local_storage/shared_preferences.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
      void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
   Future.delayed(const Duration(seconds: 2),()async{
       getIt.get<SharedPreferences>().getString(
          'token')==null?

 Navigator.of(context).pushReplacementNamed("ChangeLangScreen"):
Navigator.of(context).pushReplacementNamed("createProjectScreen");

    });
  }
  @override
  void dispose() {
   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(child: 
      SizedBox(
        width: 200.w,
        height: 200.h,
        child: Image.asset(AppAssets.helloOsscam)),),
    );
  }
}