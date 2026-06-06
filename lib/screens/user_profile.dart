import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              FirebaseAuth.instance.currentUser?.email ?? 'No email Found',
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text("Logout"),
            ),
          ),
        ],
      ),
    );
  }
}
