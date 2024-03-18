import 'package:flutter/material.dart';
import 'package:restapi/screens/user_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REST API',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const UserListScreen()
    );
  }
}

