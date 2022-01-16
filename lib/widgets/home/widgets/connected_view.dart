import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ConnectedView extends StatelessWidget {
  final FirebaseAuth auth;
  const ConnectedView({Key? key, required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("well connected ${auth.currentUser!.email}"),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.red.shade400),
            onPressed: () {},
            child: const Text(
              "Delete profile",
            ),
          )
        ],
      ),
    );
  }
}
