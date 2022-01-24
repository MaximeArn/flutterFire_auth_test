import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignedOutBtn extends StatelessWidget {
  const SignedOutBtn({Key? key}) : super(key: key);

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
      final authInstance = FirebaseAuth.instance;
      try {
        final User? user = authInstance.currentUser;
        await authInstance.signOut();
        final String? email = user!.email;
        showSnackBar(message: "$email has successfully signed out !");
      } catch (e) {
        print(e);
        rethrow;
      }
    }

    return TextButton(
      child: const Text('Sign out'),
      style: TextButton.styleFrom(primary: Colors.white),
      onPressed: logOut,
    );
  }
}
