import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_auth/widgets/signed_out_btn.dart';

class HomePage extends StatelessWidget {
  final FirebaseAuth auth;

  const HomePage({Key? key,  required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth test"),
        actions: const <Widget>[
          SignedOutBtn(),
        ],
      ),
      body: const Center(
        child: Text("HomePage"),
      ),
    );
  }
}
