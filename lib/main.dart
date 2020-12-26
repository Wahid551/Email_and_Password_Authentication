import 'package:flutter/material.dart';
import 'login.dart';
import 'signUp.dart';
import 'homePage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: create(),
      routes: {
        '/signup': (context) => signup(),
        '/homepahe': (context) => Homepage(),
      },
    );
  }
}
