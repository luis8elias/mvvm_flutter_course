import 'package:flutter_gamer/core/utils/validation_item.dart';

class LoginState {
  final ValidationItem email;
  final ValidationItem password;

  LoginState({
    this.email = const ValidationItem(),
    this.password = const ValidationItem()
  });


  LoginState copyWith({
    ValidationItem? email,
    ValidationItem? password    
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password
    );
  }

  bool get isValid => email.value.isNotEmpty && password.value.isNotEmpty;
}