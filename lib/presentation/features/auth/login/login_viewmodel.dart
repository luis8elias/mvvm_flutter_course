import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gamer/core/utils/validation_item.dart';
import 'package:flutter_gamer/presentation/features/auth/login/login_state.dart';

class LoginViewModel  extends ChangeNotifier{

  final FirebaseAuth _firebaseAuth;

  LoginState _state =  LoginState();

  LoginViewModel(this._firebaseAuth);
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

  login() async{
    if(_state.isValid){
      print('[email]=> ${_state.email.value}');
      print('[password]=> ${_state.password.value}');
      final data = await _firebaseAuth.signInWithEmailAndPassword(
        email: _state.email.value, 
        password: _state.password.value
      );
     
    }
  }
}