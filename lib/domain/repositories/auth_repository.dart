import 'package:flutter_gamer/domain/models/user_model.dart';
import 'package:flutter_gamer/domain/utils/resource.dart';

abstract class IAuthRepository{
  Future<Resource> login({required email, required password});
  Future<Resource> register({required UserModel user});

}