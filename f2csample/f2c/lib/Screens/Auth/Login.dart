import 'package:f2c/Controller/Auth_controller.dart';
import 'package:f2c/Screens/HomeScreen.dart';
import 'package:f2c/Theme/strings.dart';
import 'package:f2c/widgets/login/CustomTextField.dart';
import 'package:f2c/widgets/login/GoogleSignButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Initialize animation controller for subtle fade-in effect
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

    _animationController.forward(); // Start the animation
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFa8e063), Color(0xFF56ab2f)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          // Animated Login Form
          FadeTransition(
            opacity: _animation,
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // App Logo
                    Image.asset(
                      'assets/Green.png',
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    // Login Container with Rounded Corners and Shadow
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Email Field
                          MyTextField(
                            label: "Email",
                            onChanged: (value) {
                              // Handle email change if needed
                            },
                            licon: Icons.email,
                            controller: authController.email,
                          ),
                          const SizedBox(height: 20),
                          // Password Field with Visibility Toggle
                          Obx(() => MyTextField(
                                label: "Password",
                                obscureText: authController.isSecure.value,
                                onChanged: (value) {
                                  // Handle password change if needed
                                },
                                licon: authController.isSecure.value
                                    ? Icons.lock
                                    : Icons.lock,
                                controller: authController.password,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    authController.isSecure.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {},
                                ),
                              )),
                          const SizedBox(height: 30),
                          // Login Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                authController.login();
                              },
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                backgroundColor: const Color(0xFF56ab2f),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ), // Green color
                                elevation: 5,
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Sign Up Button
                          TextButton(
                            onPressed: () {
                              // Navigate to Sign Up Screen
                            },
                            child: Text(
                              logintext.usersignup,
                              style: const TextStyle(
                                color: Color(0xFF56ab2f),
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // OR Divider
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.withOpacity(0.7),
                                  thickness: 1,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "OR",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.withOpacity(0.7),
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Google Sign-In Button
                          GoogleSignButton(
                            title: "Sign in with Google",
                            onPressed: () {
                              // Implement Google Sign-In
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
