import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:msp_project/screens/login_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),  // Make sure this class exists in login_page.dart
    );
  }
}
