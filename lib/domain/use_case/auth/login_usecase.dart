import 'package:flutter_gamer/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginUsecase {
  IAuthRepository _authRepository;

  LoginUsecase(this._authRepository);

}