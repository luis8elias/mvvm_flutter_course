import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gamer/core/di/firebase_service.dart';
import 'package:flutter_gamer/data/repositories/firebase_auth_repository.dart';
import 'package:flutter_gamer/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule{

  @preResolve
  Future<FirebaseService> get firebaseService => FirebaseService.init();

  @injectable
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @injectable
  IAuthRepository get authRepository => FirebaseAuthRepository(firebaseAuth);

}