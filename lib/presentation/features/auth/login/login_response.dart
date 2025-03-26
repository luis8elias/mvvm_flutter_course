import 'package:flutter/material.dart';
import 'package:flutter_gamer/domain/utils/resource.dart';
import 'package:flutter_gamer/presentation/features/auth/login/login_viewmodel.dart';
import 'package:flutter_gamer/presentation/utils/progress_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginResponse{
  LoginViewModel vm;
  BuildContext context;

  LoginResponse({
    required this.vm,
    required this.context
  }){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(vm.response is Loading){
        showProgressDialog(context);
      }else if(vm.response is Error){
        Navigator.of(context).pop();
        final err = vm.response as Error;
        Fluttertoast.showToast(msg: err.message, timeInSecForIosWeb: 2);
        vm.resetResponse();
      }else if(vm.response is Success){
        Navigator.of(context).pop();
        Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
      }
    });
  }

}