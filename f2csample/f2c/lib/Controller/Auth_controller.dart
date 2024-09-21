// lib/Controller/Auth_controller.dart

import 'package:f2c/Screens/Auth/Login.dart';
import 'package:f2c/Screens/HomeScreen.dart';
import 'package:f2c/Screens/Splash/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // Text Editing Controllers
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  // Firebase Auth Instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Observable Variables
  var isSecure = true.obs;
  var isConfirmSecure = true.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // Lifecycle Method: Dispose controllers when not needed
  @override
  void onClose() {
    name.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.onClose();
  }

  /// Toggles the visibility of the password field
  void togglePasswordVisibility() {
    isSecure.value = !isSecure.value;
  }

  /// Toggles the visibility of the confirm password field
  void toggleConfirmPasswordVisibility() {
    isConfirmSecure.value = !isConfirmSecure.value;
  }

  /// Logs in the user with email and password
  Future<void> login() async {
    // Basic Validation
    if (email.text.trim().isEmpty || password.text.trim().isEmpty) {
      errorMessage.value = 'Please enter both email and password.';
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    try {
      // Firebase Sign-In
      await _auth.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      print("Login Completed");

      // Navigate to Home Screen
      Get.offAll(() => const Home2());
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific errors
      switch (e.code) {
        case 'user-not-found':
          errorMessage.value = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage.value = 'Wrong password provided.';
          break;
        case 'invalid-email':
          errorMessage.value = 'The email address is not valid.';
          break;
        default:
          errorMessage.value = 'Login failed. Please try again.';
      }
    } catch (e) {
      // Handle any other errors
      errorMessage.value = 'An unexpected error occurred.';
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  /// Signs up the user with email, password, and name
  Future<void> signup() async {
    // Basic Validation
    if (name.text.trim().isEmpty ||
        email.text.trim().isEmpty ||
        password.text.trim().isEmpty ||
        confirmPassword.text.trim().isEmpty) {
      errorMessage.value = 'Please fill in all fields.';
      return;
    }

    if (password.text.trim() != confirmPassword.text.trim()) {
      errorMessage.value = 'Passwords do not match.';
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    try {
      // Firebase Sign-Up
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      // Update the display name
      await userCredential.user!.updateDisplayName(name.text.trim());

      print("Sign Up Completed");

      // Navigate to Home Screen
      Get.offAll(() => const Home2());
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific errors
      switch (e.code) {
        case 'weak-password':
          errorMessage.value = 'The password provided is too weak.';
          break;
        case 'email-already-in-use':
          errorMessage.value = 'An account already exists for that email.';
          break;
        case 'invalid-email':
          errorMessage.value = 'The email address is not valid.';
          break;
        default:
          errorMessage.value = 'Signup failed. Please try again.';
      }
    } catch (e) {
      // Handle any other errors
      errorMessage.value = 'An unexpected error occurred.';
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  /// Signs up the user using Google Sign-In (Implementation Needed)
  Future<void> signUpWithGoogle() async {
    // Implement Google Sign-In logic here
    // For example, using GoogleSignIn and FirebaseAuth
    // This requires additional setup and is beyond the scope of this response
  }

  /// Logs out the user
  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAll(() => const LoginPage());
    } catch (e) {
      print("Error during logout: $e");
    }
  }
}
