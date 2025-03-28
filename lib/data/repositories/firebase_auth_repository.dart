import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gamer/domain/models/user_model.dart';
import 'package:flutter_gamer/domain/repositories/auth_repository.dart';
import 'package:flutter_gamer/domain/utils/resource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IAuthRepository)
class FirebaseAuthRepository extends IAuthRepository {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthRepository(this._firebaseAuth);

  @override
  Future<Resource> login({required email, required password}) async {
    try {
      final data = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Success(data);
    } on FirebaseAuthException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }

  @override
  Future<Resource> register({required UserModel user}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email, 
        password: user.password,
      );
      return Success(userCredential.credential);
    } on FirebaseAuthException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }
}
