import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_auth/widgets/home.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;

  @override
  void initState() {
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const HomePage()
      : Scaffold(
          appBar: AppBar(
            title: const Text("Verify Eamil"),
          ),
          body: const Center(
            child: Text("verify email "),
          ),
        );
}
