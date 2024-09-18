// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LogInModel {
  String email;
  String password;
  LogInModel({
    required this.email,
    required this.password,
  });

  LogInModel copyWith({
    String? email,
    String? password,
  }) {
    return LogInModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LogInModel.fromMap(Map<String, dynamic> map) {
    return LogInModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LogInModel.fromJson(String source) => LogInModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LogInModel(email: $email, password: $password)';

  @override
  bool operator ==(covariant LogInModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
