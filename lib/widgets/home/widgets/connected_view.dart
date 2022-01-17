import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ConnectedView extends StatelessWidget {
  final FirebaseAuth auth;
  const ConnectedView({Key? key, required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void deleteAccount() async {
      try {
        await auth.currentUser!.delete();
      }on FirebaseAuthException catch (e) {
          if (e.code == 'requires-recent-login')
            // TODO: display the message to the user maybe using a snackBar
            print("Please reauthenticate yourself before deleting your account ");
      }
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("well connected ${auth.currentUser!.email}"),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.red.shade400),
            onPressed: deleteAccount,
            child: const Text(
              "Delete account",
            ),
          )
        ],
      ),
    );
  }
}
