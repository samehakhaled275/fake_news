import 'package:flutter/material.dart';

class FormSubmitButton extends StatelessWidget {
  String text;

  VoidCallback onPressed;

  FormSubmitButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 28),
          backgroundColor: Colors.red,
          // maximumSize: Size(270, 60)
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: 'outfit'),
        ));
  }
}
