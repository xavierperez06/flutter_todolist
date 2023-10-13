import 'package:flutter/material.dart';
import 'package:hackday_flutter/src/pages/todo_page.dart';
import 'package:hackday_flutter/src/pages/welcome_page.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
      routes: {
        "todopage": (context) => const ToDoPage(),
      },
    );
  }
}