import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manger_app/core/config/local_storage/shared_preferences.dart';
import 'package:manger_app/core/config/theme/theme.dart';
import 'package:manger_app/feature/auth/page/chose_language_screen.dart';
import 'package:manger_app/feature/auth/page/create_project_screen.dart';
import 'package:manger_app/feature/auth/page/login_screen.dart';
import 'package:manger_app/feature/auth/page/signup_screen.dart';
import 'package:manger_app/feature/auth/page/splash_screen.dart';
import 'package:manger_app/feature/order/page/add_new_project.dart';
import 'package:manger_app/feature/order/page/drawer_page.dart';
import 'package:manger_app/feature/order/page/project_home.dart';
import 'package:manger_app/feature/order/page/tasks_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feature/auth/bloc/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initgetit();
  getIt.get<SharedPreferences>().getString(
        'languagecode',
      );
  Bloc.observer = MyBlocObserver();
  runApp(EasyLocalization(
      path: "assets/translation",
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      fallbackLocale: const Locale('en'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            home: SplashScreen(),
            routes: {
              'login': (context) => const LogInScreen(),
              'signup': (context) => const SignUpScreen(),
              'ChangeLangScreen': (context) => const ChangeLangScreen(),
              'createProjectScreen': (context) => const CreateProjectScreen(),
              'addNewProjectScreen': (context) => const AddNewProjectScreen(),
              'tasksScreen': (context) => TasksScreen(),
              'ProjectHome': (context) => ProjectHome(),
              'DrawerPage': (context) => const DrawerPage(),
            },
          );
        });
  }
}
