  // ignore_for_file: avoid_print

  import 'package:dio/dio.dart';
import 'package:manger_app/core/domin/model/auth_model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/local_storage/shared_preferences.dart';
import '../model/auth_model/signup_model.dart';

abstract class AuthService {
   
   login(LogInModel logInModel );
   signup(SignUpModel authModel);
 } 
 class AuthImpl extends AuthService{
  @override
  login(logInModel)async {
    Dio dio=Dio();
    try{

    Response response=await dio.post('https://projects-management-system.onrender.com/api/v1/auth/authenticate',data: logInModel.toJson(),
    
    
    options: Options(
    sendTimeout: const Duration(seconds: 60),
        headers: {
          "Content-Type":"application/json",
         'accept':' */*',
        }
      ),
    );
      print('---------response');
     print(response);
        if (response.statusCode==200){
          print('trueeeeeeeeeee');
      print(response.data['token']);
       getIt.get<SharedPreferences>().setString(
          'token',response.data['token'] );
      return true;
      
    }
else {          print('falseeeee');

  return 'false';}
    
}  catch(e){
return e.toString();
}
  }
 
  @override
  signup(authModel)async {
    Dio dio=Dio();
    try{

    Response response=await dio.post('https://projects-management-system.onrender.com/v1/auth/register',data: authModel.toJson(),
    options: Options(
    sendTimeout: const Duration(seconds: 60),
        headers: {
          'accept':' */*',
          "Content-Type":"application/json",
         
        }
      ),
    );
     print(response);
      print('---------response');
        if (response.statusCode==200){
          print('trueeeeeeeeeee');
   print(response.data['token']);
      return true;
      
    }
else {          print('falseeeee');

  return 'false';}
    
}  catch(e){
return e.toString();
}
  }
 }
//  {
//   "access_token": "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaHM4OTk1MDVAZ21haWwuY29tIiwiaWF0IjoxNzE2ODMxOTIzLCJleHAiOjE3MTc0MzY3MjN9.9oSS1pKbZXLsD-5lid5xbqjNY2lxcuW9PSvI1E9w9_E",
//   "refresh_token": "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaHM4OTk1MDVAZ21haWwuY29tIiwiaWF0IjoxNzE2ODMxOTIzLCJleHAiOjE3MTQ5NTYxNTZ9.gHzvgypQD4PY3Nmwk3fANOgNL9nu2NRkfC3-F6eRM_c"
// }
