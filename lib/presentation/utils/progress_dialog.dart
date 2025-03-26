import 'package:flutter/material.dart';

showProgressDialog(BuildContext context){
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(
      child: CircularProgressIndicator.adaptive(),
    ),
  );
}