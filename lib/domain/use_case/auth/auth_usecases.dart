import 'package:flutter_gamer/domain/use_case/auth/login_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AuthUsecases{
  AuthUsecases({
    required this.login
  });
  LoginUsecase login;

}