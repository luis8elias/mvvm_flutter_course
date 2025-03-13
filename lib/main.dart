import 'package:flutter/material.dart';
import 'package:flutter_gamer/presentation/features/auth/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightGreen,
          brightness: Brightness.dark
        ).copyWith(
          primary: Colors.lightGreen,
          onPrimary: Colors.black
        ),
      ),
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginScreen()
      }
    );
  }
}

