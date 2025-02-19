import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with SingleTickerProviderStateMixin {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Password Validation
  bool isPasswordStrong(String password) {
    String pattern = r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }

  void registerUser() {
    String name = nameController.text.trim();
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (name.isEmpty || username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields are required"), backgroundColor: Colors.redAccent),
      );
      return;
    }

    if (!isPasswordStrong(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password must have at least 6 characters, one uppercase letter, one number, and one special character."),
          backgroundColor: Colors.orangeAccent,
        ),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match"), backgroundColor: Colors.redAccent),
      );
      return;
    }

    // Registration Success
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Registered successfully!"), backgroundColor: Colors.green),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade300, // Same as login page
              Colors.blue.shade700,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Logo
                    Image.asset(
                      "lib/assets/images/logo.png",
                      height: 80, // Reduced size for better spacing
                    ),
                    const SizedBox(height: 15),

                    // Title
                    const Text(
                      "Create an Account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Name Field
                    buildTextField("Nickname", Icons.person, nameController),
                    const SizedBox(height: 10),

                    // Username Field
                    buildTextField("Username", Icons.account_circle, usernameController),
                    const SizedBox(height: 10),

                    // Password Field
                    buildPasswordField("Password", passwordController, isPasswordVisible, () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    }),
                    const SizedBox(height: 10),

                    // Confirm Password Field
                    buildPasswordField("Confirm Password", confirmPasswordController, isConfirmPasswordVisible, () {
                      setState(() {
                        isConfirmPasswordVisible = !isConfirmPasswordVisible;
                      });
                    }),
                    const SizedBox(height: 20),

                    // Register Button
                    ElevatedButton(
                      onPressed: registerUser,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12), // Reduced button height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Register",
                        style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Back to Login
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Already have an account? Login",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Custom Text Field
  Widget buildTextField(String label, IconData icon, TextEditingController controller) {
    return SizedBox(
      height: 50, // Reduced height to prevent overflow
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.blueAccent),
          filled: true,
          fillColor: Colors.white, // Solid white
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: Colors.black), // Changed to black for better readability
      ),
    );
  }

  // Custom Password Field with Visibility Toggle
  Widget buildPasswordField(String label, TextEditingController controller, bool isVisible, VoidCallback toggleVisibility) {
    return SizedBox(
      height: 50, // Reduced height
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
          fillColor: Colors.white, // Solid white
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: Colors.black), // Changed to black for better readability
      ),
    );
  }
}
