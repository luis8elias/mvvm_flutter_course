import 'package:flutter_gamer/domain/utils/resource.dart';

abstract class IAuthRepository{
  Future<Resource> login({required email, required password});

}