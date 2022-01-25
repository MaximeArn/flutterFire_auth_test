import 'package:flutter/material.dart';

class NotConnected extends StatelessWidget {
  static const routeName = "notConnectedView";
  const NotConnected({Key? key}) : super(key: key);

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
              onPressed: () => Navigator.of(context).pushNamed("registerForm"),
              child: const Text("Register"),
            ),
            Container(
              width: 25,
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed("loginForm"),
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
