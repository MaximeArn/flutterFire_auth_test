import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ConnectedView extends StatelessWidget {
  final FirebaseAuth auth;
  const ConnectedView({Key? key, required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("well connected ${auth.currentUser!.email}"),
    );
  }
}
