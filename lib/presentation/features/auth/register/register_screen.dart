import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gamer/core/extensions/build_context_extrensions.dart';
import 'package:flutter_gamer/presentation/features/auth/register/register_view_model.dart';
import 'package:flutter_gamer/presentation/widgets/buttons.dart';
import 'package:flutter_gamer/presentation/widgets/inputs.dart';
import 'package:provider/provider.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterViewModel(),
      child: _RegisterScreenUI(),
    );
  }
}


class _RegisterScreenUI extends StatelessWidget {
  const _RegisterScreenUI();

  @override
  Widget build(BuildContext context) {

    final vm = context.read<RegisterViewModel>();
    final reactiveVm = context.watch<RegisterViewModel>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                color: context.colorScheme.primary,
                height: context.height * 0.25,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(
                        top: 25
                      ),
                      child: IconButton(
                        onPressed: ()=> Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: context.colorScheme.onPrimary,
                        )
                      ),
                    ),
                    Row(
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
                'Registro',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15.0,),
              child: DefaultTextField(
                errorText: reactiveVm.state.username.error,
                onChanged: (value) => vm.changeUsername(value),
                label: 'Nombre', 
                icon: Icons.person_2_outlined,
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
                text: 'Registrarse',
                onPressed: reactiveVm.state.isValid?  ()=> vm.login() : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}