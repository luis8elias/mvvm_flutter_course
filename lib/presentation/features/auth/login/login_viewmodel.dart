import 'package:flutter/material.dart';
import 'package:flutter_gamer/core/utils/validation_item.dart';
import 'package:flutter_gamer/presentation/features/auth/login/login_state.dart';

class LoginViewModel  extends ChangeNotifier{
  LoginState _state =  LoginState();
  LoginState get state => _state;

  

  changeEmail(String email){
    if(email.length >= 3){
      _state = _state.copyWith(
        email: ValidationItem(value: email, error: null),
      );
    }
    if(email.length < 3){
      _state = _state.copyWith(
        email: ValidationItem(error: 'Ingrese al menos 3 caracteres'),
      );
    }
    notifyListeners();
  }

  changePassword(String password){
    if(password.length >= 3){
      _state = _state.copyWith(
        password: ValidationItem(value: password, error: null),
      );
    }
    if(password.length < 3){
      _state = _state.copyWith(
        email: ValidationItem(error: 'Ingrese al menos 3 caracteres'),
      );
    }
    notifyListeners();
  }

  login(){
    if(_state.isValid){
      print('[email]=> ${_state.email.value}');
      print('[password]=> ${_state.password.value}');
    }
  }
}