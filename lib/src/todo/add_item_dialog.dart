import 'package:flutter/material.dart';

import '../common/my_button.dart';

class AddItemDialog extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  AddItemDialog({
    super.key, 
    required this.controller,
    required this.onSave,
    required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller:  controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Task description"
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: onSave),

                const SizedBox(width: 8),

                MyButton(
                  text: "Cancel", 
                  onPressed: onCancel, 
                  primary: false,
                ),
            ]),
          ]
        ),
      ),
    );
  }
}