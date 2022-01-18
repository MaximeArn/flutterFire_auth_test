import 'package:flutter/material.dart';

class NotConnected extends StatelessWidget {
  const NotConnected({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth test"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "registerForm"),
              child: const Text("Register"),
            ),
            Container(
              width: 25,
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "loginForm"),
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}