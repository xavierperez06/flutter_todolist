import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text; //Final means single-assignment: a final variable or field must have an initializer. Once assigned a value, a final variable's value cannot be changed.
  VoidCallback onPressed;
  final bool primary;
  
  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.primary = true
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: primary ? const Color(0xff1B365D) : Colors.grey.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      child: Text(
        text, 
        style: TextStyle(
          color: primary ? Colors.white : Colors.black
        ),
      ),
    );
  }
}