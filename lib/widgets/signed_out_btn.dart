import 'package:flutter/material.dart';

class SignedOutBtn extends StatelessWidget {
  const SignedOutBtn({Key? key}) : super(key: key);

  void logOut() => {
    print("hello")
  };

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('Sign out'),
      style: TextButton.styleFrom(primary: Colors.white),
      onPressed: logOut,
    );
  }
}
