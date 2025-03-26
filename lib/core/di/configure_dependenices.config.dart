// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:flutter_gamer/core/di/app_module.dart' as _i840;
import 'package:flutter_gamer/core/di/firebase_service.dart' as _i328;
import 'package:flutter_gamer/data/repositories/firebase_auth_repository.dart'
    as _i540;
import 'package:flutter_gamer/domain/repositories/auth_repository.dart'
    as _i278;
import 'package:flutter_gamer/domain/use_case/auth/auth_usecases.dart' as _i981;
import 'package:flutter_gamer/domain/use_case/auth/login_usecase.dart' as _i515;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

const String _repositories = 'repositories';
const String _use_cases = 'use_cases';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    await gh.factoryAsync<_i328.FirebaseService>(
      () => appModule.firebaseService,
      preResolve: true,
    );
    gh.factory<_i59.FirebaseAuth>(() => appModule.firebaseAuth);
    gh.factory<_i278.IAuthRepository>(
      () => appModule.authRepository,
      registerFor: {_repositories},
    );
    gh.factory<_i981.AuthUsecases>(
      () => appModule.authUsecases,
      registerFor: {_use_cases},
    );
    gh.factory<_i278.IAuthRepository>(
      () => _i540.FirebaseAuthRepository(gh<_i59.FirebaseAuth>()),
    );
    gh.factory<_i515.LoginUsecase>(
      () => _i515.LoginUsecase(gh<_i278.IAuthRepository>()),
    );
    gh.factory<_i981.AuthUsecases>(
      () => _i981.AuthUsecases(login: gh<_i515.LoginUsecase>()),
    );
    return this;
  }
}

class _$AppModule extends _i840.AppModule {}
