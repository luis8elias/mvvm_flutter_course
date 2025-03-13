import 'package:flutter/material.dart';
import 'package:flutter_gamer/core/extensions/build_context_extrensions.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      child: Stack(
        children: [
          Container(
            height: 50,
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(color: context.colorScheme.onPrimary),
            ),
          ),
          Container(
            height: 50,
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: context.colorScheme.onPrimary,
              child: Icon(Icons.arrow_forward_ios, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
