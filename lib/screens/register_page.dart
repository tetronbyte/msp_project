import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  // Toggle password visibility
  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void toggleConfirmPasswordVisibility() {
    setState(() {
      isConfirmPasswordVisible = !isConfirmPasswordVisible;
    });
  }

  // Strong password validation
  bool isStrongPassword(String password) {
    final strongPasswordRegex = RegExp(
        r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$');
    return strongPasswordRegex.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade300, Colors.blue.shade700], // Same as login page
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo
                Image.asset(
                  "lib/assets/images/logo.png",
                  height: 100,
                ),
                const SizedBox(height: 20),

                // Register Text
                const Text(
                  "Create an Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                // Full Name Field
                buildTextField("Full Name", Icons.person, fullNameController),
                const SizedBox(height: 10),

                // Username Field
                buildTextField("Username", Icons.account_circle, usernameController),
                const SizedBox(height: 10),

                // Email Field
                buildTextField("Email", Icons.email, emailController),
                const SizedBox(height: 10),

                // Password Field
                buildPasswordField("Password", passwordController, isPasswordVisible, togglePasswordVisibility),
                const SizedBox(height: 10),

                // Confirm Password Field
                buildPasswordField("Confirm Password", confirmPasswordController, isConfirmPasswordVisible, toggleConfirmPasswordVisibility),
                const SizedBox(height: 20),

                // Register Button
                buildRegisterButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Generic Text Field
  Widget buildTextField(String label, IconData icon, TextEditingController controller) {
    return SizedBox(
      height: 60,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.blueAccent),
          filled: true,
          fillColor: Colors.white, // White input boxes
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto, // Moves inside box
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  // Password Text Field with Visibility Toggle
  Widget buildPasswordField(String label, TextEditingController controller, bool isVisible, VoidCallback toggleVisibility) {
    return SizedBox(
      height: 60,
      child: TextField(
        controller: controller,
        obscureText: !isVisible,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: const Icon(Icons.lock, color: Colors.blueAccent),
          suffixIcon: IconButton(
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.blueAccent,
            ),
            onPressed: toggleVisibility,
          ),
          filled: true,
          fillColor: Colors.white, // White input boxes
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto, // Moves inside box
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  // Register Button
  Widget buildRegisterButton() {
    return ElevatedButton(
      onPressed: () {
        if (!isStrongPassword(passwordController.text)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Password must have at least 1 capital letter, 1 number, 1 special character, and be 6+ characters long."),
              backgroundColor: Colors.redAccent,
            ),
          );
          return;
        }

        if (passwordController.text != confirmPasswordController.text) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Passwords do not match."),
              backgroundColor: Colors.redAccent,
            ),
          );
          return;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Registered successfully"),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Text(
        "Register",
        style: TextStyle(fontSize: 18, color: Colors.blueAccent),
      ),
    );
  }
}
