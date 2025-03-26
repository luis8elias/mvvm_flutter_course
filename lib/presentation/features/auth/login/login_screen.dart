import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gamer/core/di/configure_dependenices.dart';
import 'package:flutter_gamer/core/extensions/build_context_extrensions.dart';
import 'package:flutter_gamer/presentation/features/auth/login/login_response.dart';
import 'package:flutter_gamer/presentation/features/auth/login/login_viewmodel.dart';
import 'package:flutter_gamer/presentation/features/auth/register/register_screen.dart';
import 'package:flutter_gamer/presentation/widgets/buttons.dart';
import 'package:flutter_gamer/presentation/widgets/inputs.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(locator.get()),
      child: _LoginScreenUI(),
    );
  }
}

class _LoginScreenUI extends StatelessWidget {
  const _LoginScreenUI();

  @override
  Widget build(BuildContext context) {

    final vm = context.read<LoginViewModel>();
    final reactiveVm = context.watch<LoginViewModel>();
    LoginResponse(vm: vm, context: context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                color: context.colorScheme.primary,
                height: context.height * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/img/gamepad.png',
                      height: 60,
                      width: 150,
                    ),
                    Text(
                      'Gamer MVVM',
                      style: context.textTheme.displaySmall?.copyWith(
                        fontSize: 24,
                        color: context.colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, top: 15.0),
              child: Text(
                'Continua con',
                style: TextStyle(
                  fontSize: 20.0
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15.0,),
              child: DefaultTextField(
                errorText: reactiveVm.state.email.error,
                onChanged: (value) => vm.changeEmail(value),
                label: 'Correo electrónico', 
                icon: Icons.email_outlined,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15.0,),
              child: DefaultTextField(
                errorText: reactiveVm.state.password.error,
                onChanged: (value) => vm.changePassword(value),
                label: 'Contrasena', 
                icon: Icons.lock_outline,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 15, 
                vertical: 16,
              ),
              width: double.infinity,
              child: DefaultButton(
                text: 'Iniciar sesión',
                onPressed: reactiveVm.state.isValid?  ()=> vm.login() : null,
              )
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                top: 40.0,
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text(
                  'No tienes cuenta?',
                  style: TextStyle(
                    color: context.colorScheme.secondary
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}