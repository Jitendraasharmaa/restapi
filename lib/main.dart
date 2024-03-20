import 'package:flutter/material.dart';
import 'package:restapi/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //  ToastContext().init(context);
    return MaterialApp(
      title: 'REST API',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen()
    );
  }
}

