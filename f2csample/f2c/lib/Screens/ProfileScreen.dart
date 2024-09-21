import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileScreen extends StatelessWidget {
  final String name;
  final String email;
  final String profileImageUrl;

  const ProfileScreen({
    Key? key,
    required this.name,
    required this.email,
    required this.profileImageUrl,
  }) : super(key: key);

  Future<void> _signOut(BuildContext context) async {
    try {
      // Sign out from Firebase
      await FirebaseAuth.instance.signOut();

      // Sign out from Google
      await GoogleSignIn().signOut();

      // Navigate back to the sign-in page
      Navigator.of(context).pushReplacementNamed('/login');
    } catch (e) {
      print('Error during sign out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(profileImageUrl),
            ),
            SizedBox(height: 16),
            Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              email,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _signOut(context),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
