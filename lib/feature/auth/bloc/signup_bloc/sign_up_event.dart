// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:manger_app/core/domin/model/auth_model/signup_model.dart';

class SignUpEvent {

}
class SignUpSuccess extends SignUpEvent {
  SignUpModel signupModel;
  SignUpSuccess({
    required this.signupModel,
  });
}
class IsSecretEvent extends SignUpEvent {
 
}
