// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:manger_app/core/domin/model/auth_model/login_model.dart';

class LogInEvent {}
class LogInSuccess extends LogInEvent {
  LogInModel logInModel;
  LogInSuccess({
    required this.logInModel,
  });
  
}
class IsSecretEvent extends LogInEvent {
 
}
