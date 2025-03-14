import 'package:flutter/material.dart';
import 'package:flutter_gamer/core/utils/validation_item.dart';
import 'package:flutter_gamer/presentation/features/auth/register/register_state.dart';


class RegisterViewModel  extends ChangeNotifier{
  RegisterState _state =  RegisterState();
  RegisterState get state => _state;

  changeUsername(String name){
    if(name.length >= 3){
      _state = _state.copyWith(
        username: ValidationItem(value: name, error: null),
      );
    }
    if(name.length < 3){
      _state = _state.copyWith(
        username: ValidationItem(error: 'Ingrese al menos 3 caracteres'),
      );
    }
    notifyListeners();
  }

  

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
      print('[name]=> ${_state.username.value}');
      print('[email]=> ${_state.email.value}');
      print('[password]=> ${_state.password.value}');
    }
  }
}