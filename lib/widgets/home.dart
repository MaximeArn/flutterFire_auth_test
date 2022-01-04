import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_auth/widgets/signed_out_btn.dart';

class HomePage extends StatelessWidget {
  final FirebaseAuth auth;

  const HomePage({Key? key, required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth test"),
        actions: <Widget>[
          SignedOutBtn(
            auth: auth,
          ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(16),
        children: const <Widget>[],
      ),
    );
  }
}
