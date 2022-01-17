import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_auth/widgets/landing/widgets/connected_view.dart';
import 'package:flutterfire_auth/widgets/landing/widgets/not_connected_view.dart';

class LandingPage extends StatelessWidget {
  final FirebaseAuth auth;
  const LandingPage({Key? key, required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = (snapshot.data as User?);
          print(user);
          if (user == null) {
            return NotConnectedView(auth: auth);
          } else {
            return ConnectedView(auth: auth);
          }
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
