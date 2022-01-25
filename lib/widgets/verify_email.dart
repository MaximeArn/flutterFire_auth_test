import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatelessWidget {
  static const routeName = "verifyEmail";
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void sendNewVerificationLink() async {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        await user!.reload();
        if (!user.emailVerified) {
          await user.sendEmailVerification();
        }
      } catch (e) {
        print(e);
        rethrow;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Authentication"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                "You must verify your email to access the rest of the app"),
            ElevatedButton(
                onPressed: sendNewVerificationLink,
                child: const Text("Send new link"))
          ],
        ),
      ),
    );
  }
}
