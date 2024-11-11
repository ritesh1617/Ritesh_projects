
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:organic_food_app/Controller/Auth_controller.dart';
// import 'package:organic_food_app/Theme/strings.dart';
// import 'package:organic_food_app/widgets/login/Buttion.dart';
// import 'package:organic_food_app/widgets/login/Customtextfield.dart';

// class SignupPage extends StatefulWidget {
//   const SignupPage({Key? key}) : super(key: key); // Corrected constructor

//   @override
//   State<SignupPage> createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize animation controller for fade-in effect
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 800),
//       vsync: this,
//     );
//     _animation =
//         CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

//     _animationController.forward(); // Start the animation
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Use Get.put only once per controller to prevent multiple instances
//     final AuthController authController = Get.put(AuthController());

//     return Scaffold(
//       body: Stack(
//         children: [
//           // Gradient Background
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xFFa8e063), Color(0xFF56ab2f)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//           ),
//           // Semi-transparent overlay
//           Container(
//             color: Colors.black.withOpacity(0.3),
//           ),
//           // Animated Signup Form
//           FadeTransition(
//             opacity: _animation,
//             child: Center(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // App Logo
//                     Image.asset(
//                       'assets/Green.png',
//                       height: 100,
//                       fit: BoxFit.contain,
//                     ),
//                     const SizedBox(height: 20),
//                     // Signup Container with Rounded Corners and Shadow
//                     Container(
//                       padding: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.9),
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 20,
//                             offset: const Offset(0, 10),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           // Name Field
//                           MyTextField(
//                             label: "Name",
//                             hintText: "Enter your full name",
//                             onChanged: (value) {
//                               // Optional: Additional logic
//                             },
//                             licon: Icons.person, // Correct parameter name
//                             controller: authController.name,
//                             keyboardType: TextInputType.name,
//                           ),
//                           const SizedBox(height: 20),

//                           // Email Field
//                           MyTextField(
//                             label: "Email",
//                             hintText: "Enter your email",
//                             onChanged: (value) {
//                               // Optional: Additional logic
//                             },
//                             licon: Icons.email, // Correct parameter name
//                             controller: authController.email,
//                             keyboardType: TextInputType.emailAddress,
//                           ),
//                           const SizedBox(height: 20),

//                           // Password Field with Visibility Toggle
//                           Obx(() => MyTextField(
//                                 label: "Password",
//                                 hintText: "Enter your password",
//                                 obscureText: authController.isSecure.value,
//                                 onChanged: (value) {
//                                   // Optional: Additional logic
//                                 },
//                                 licon: authController.isSecure.value
//                                     ? Icons.visibility
//                                     : Icons
//                                         .visibility_off, // Correct parameter name
//                                 controller: authController.password,
//                                 suffixIcon: IconButton(
//                                   icon: Icon(
//                                     authController.isSecure.value
//                                         ? Icons.visibility
//                                         : Icons.visibility_off,
//                                     color: Colors.grey,
//                                   ),
//                                   onPressed: () {
//                                     authController.togglePasswordVisibility();
//                                   },
//                                 ),
//                               )),
//                           const SizedBox(height: 20),

//                           // Confirm Password Field with Visibility Toggle
//                           Obx(() => MyTextField(
//                                 label: "Confirm Password",
//                                 hintText: "Re-enter your password",
//                                 obscureText:
//                                     authController.isConfirmSecure.value,
//                                 onChanged: (value) {
//                                   // Optional: Additional logic
//                                 },
//                                 licon: authController.isConfirmSecure.value
//                                     ? Icons.visibility
//                                     : Icons
//                                         .visibility_off, // Correct parameter name
//                                 controller: authController.confirmPassword,
//                                 suffixIcon: IconButton(
//                                   icon: Icon(
//                                     authController.isConfirmSecure.value
//                                         ? Icons.visibility
//                                         : Icons.visibility_off,
//                                     color: Colors.grey,
//                                   ),
//                                   onPressed: () {
//                                     authController
//                                         .toggleConfirmPasswordVisibility();
//                                   },
//                                 ),
//                               )),
//                           const SizedBox(height: 30),

//                           // Signup Button
//                           SizedBox(
//                             width: double.infinity,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 authController.signup();
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 16),
//                                 backgroundColor: const Color(0xFF56ab2f),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                 ), // Green color
//                                 elevation: 5,
//                               ),
//                               child: const Text(
//                                 "Sign Up",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 20),

//                           // Already have an account? Login Button
//                           TextButton(
//                             onPressed: () {
//                               // Navigate to Login Screen
//                               Get.back();
//                             },
//                             child: Text(
//                               logintext
//                                   .alreadyHaveAccount, // e.g., "Already have an account? Login"
//                               style: const TextStyle(
//                                 color: Color(0xFF56ab2f),
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 20),

//                           // OR Divider
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: Divider(
//                                   color: Colors.grey.withOpacity(0.7),
//                                   thickness: 1,
//                                 ),
//                               ),
//                               const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 10),
//                                 child: Text(
//                                   "OR",
//                                   style: TextStyle(color: Colors.grey),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Divider(
//                                   color: Colors.grey.withOpacity(0.7),
//                                   thickness: 1,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 20),

//                           // Google Sign-Up Button
//                           GoogleSignButton(
//                             title: "Sign up with Google",
//                             onPressed: () {
//                               authController.signUpWithGoogle();
//                             },
//                           ),

//                           // Display Error Message
//                           Obx(() {
//                             if (authController.errorMessage.isNotEmpty) {
//                               return Padding(
//                                 padding: const EdgeInsets.only(top: 10),
//                                 child: Text(
//                                   authController.errorMessage.value,
//                                   style: const TextStyle(
//                                       color: Colors.red, fontSize: 14),
//                                 ),
//                               );
//                             }
//                             return const SizedBox.shrink();
//                           }),

//                           // Show Loading Indicator
//                           Obx(() {
//                             if (authController.isLoading.value) {
//                               return const Padding(
//                                 padding: EdgeInsets.only(top: 20),
//                                 child: CircularProgressIndicator(
//                                   valueColor: AlwaysStoppedAnimation<Color>(
//                                       Color(0xFF56ab2f)),
//                                 ),
//                               );
//                             }
//                             return const SizedBox.shrink();
//                           }),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
