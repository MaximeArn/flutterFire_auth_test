import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_auth/utils.dart';
import 'package:flutterfire_auth/widgets/home.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    print(isEmailVerified);
    super.initState();

    if (!isEmailVerified) {
      sendEmailVerification();
      print("just before timer");
      Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future sendEmailVerification() async {
    try {
      final User user = FirebaseAuth.instance.currentUser!;
      user.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
      rethrow;
    }
  }

  Future checkEmailVerified() async {
    print("Start checkEmailVerified");
    await FirebaseAuth.instance.currentUser!.reload();
    print(isEmailVerified);
    setState(() =>
        isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified);
    if (isEmailVerified) timer?.cancel();
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
