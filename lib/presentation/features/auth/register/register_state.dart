import 'package:flutter_gamer/core/utils/validation_item.dart';

class RegisterState{
  final ValidationItem username;
  final ValidationItem email;
  final ValidationItem password;

  RegisterState({
    this.username = const ValidationItem(),
    this.email = const ValidationItem(),
    this.password = const ValidationItem(),
  });

  RegisterState copyWith({
    ValidationItem? username,
    ValidationItem? email,
    ValidationItem? password    
  }) {
    return RegisterState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password
    );
  }

  bool get isValid => email.value.isNotEmpty && password.value.isNotEmpty && username.value.isNotEmpty;
}