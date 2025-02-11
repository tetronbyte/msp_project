import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  void handleLogin() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    var user = await authService.signInWithEmail(email, password);  // Fixed function name
    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Successful!")),
      );
      // Navigate to Home Page
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Failed! Check credentials.")),
      );
    }
  }

  void handleSignup() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    var user = await authService.signUpWithEmail(email, password);  // Fixed function name
    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Account Created!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Signup Failed!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: handleLogin, child: Text("Login")),
            TextButton(onPressed: handleSignup, child: Text("Create Account")),
          ],
        ),
      ),
    );
  }
}
