import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_auth/widgets/signed_out_btn.dart';

class Connected extends StatelessWidget {
  static const routeName = "connectedView";
  const Connected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void deleteAccount() async {
      try {
        await FirebaseAuth.instance.currentUser!.delete();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'requires-recent-login')
          print("Please reauthenticate yourself before deleting your account ");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth test"),
        actions: const <Widget>[
          SignedOutBtn(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("well connected ${FirebaseAuth.instance.currentUser!.displayName}"),
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
