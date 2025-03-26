import 'package:flutter_gamer/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginUsecase {
  final IAuthRepository _authRepository;

  LoginUsecase(this._authRepository);

  launch({required String email, required String password})=> _authRepository.login(email: email, password: password);

}