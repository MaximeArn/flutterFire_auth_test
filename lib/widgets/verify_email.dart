import 'package:flutter/material.dart';

class VerifyEmail extends StatelessWidget {
  static const routeName = "verifyEmail";
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void sendNewVerificationLink() {
      print("send new verification link");
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
