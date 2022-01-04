import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignedOutBtn extends StatelessWidget {
  final FirebaseAuth auth;
  const SignedOutBtn({Key? key, required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showSnackBar({required String message}) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }

    void logOut() async {
      final User? user = auth.currentUser;
      if (user == null) {
        showSnackBar(message: "No one has signed in !");
      } else {
        await auth.signOut();
        final String uid = user.uid;
        showSnackBar(message: "$uid has successfully signed out !");
      }
    }

    return TextButton(
      child: const Text('Sign out'),
      style: TextButton.styleFrom(primary: Colors.white),
      onPressed: logOut,
    );
  }
}
