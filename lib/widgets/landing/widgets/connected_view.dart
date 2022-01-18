import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_auth/widgets/signed_out_btn.dart';

class Connected extends StatelessWidget {
  final FirebaseAuth auth;
  const Connected({Key? key, required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void deleteAccount() async {
      try {
        await auth.currentUser!.delete();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'requires-recent-login')
          // TODO: display the message to the user maybe using a snackBar
          print("Please reauthenticate yourself before deleting your account ");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth test"),
        actions: <Widget>[
          SignedOutBtn(
            auth: auth,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("well connected ${auth.currentUser!.displayName}"),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red.shade400),
              onPressed: deleteAccount,
              child: const Text(
                "Delete account",
              ),
            )
          ],
        ),
      ),
    );
  }
}
