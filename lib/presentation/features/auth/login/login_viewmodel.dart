import 'package:flutter/material.dart';
import 'package:flutter_gamer/core/utils/validation_item.dart';
import 'package:flutter_gamer/domain/use_case/auth/auth_usecases.dart';
import 'package:flutter_gamer/domain/utils/resource.dart';
import 'package:flutter_gamer/presentation/features/auth/login/login_state.dart';

class LoginViewModel  extends ChangeNotifier{

  AuthUsecases _authUsecases;

  LoginState _state =  LoginState();
  Resource _response = Init();

  LoginViewModel(this._authUsecases);
  LoginState get state => _state;
  Resource get response => _response;

  

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
        password: ValidationItem(error: 'Ingrese al menos 3 caracteres'),
      );
    }
    notifyListeners();
  }

  login() async{
    if(_state.isValid){ 
      _response = Loading();
      notifyListeners();
      _response = await _authUsecases.login.launch(
        email: state.email.value, 
        password: state.password.value,
      );
      notifyListeners();
    }
  }

  resetResponse(){
    _response = Init();
  }
}