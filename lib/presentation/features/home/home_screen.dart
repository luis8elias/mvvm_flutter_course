import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gamer/core/extensions/build_context_extrensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                'Home',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}