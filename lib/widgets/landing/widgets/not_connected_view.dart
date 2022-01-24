import 'package:flutter/material.dart';

class NotConnected extends StatelessWidget {
  static const routeName = "notConnectedView";
  final GlobalKey<NavigatorState> navigatorKey;
  const NotConnected({Key? key, required this.navigatorKey}) : super(key: key);

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
              // onPressed: () => Navigator.pushNamed(context, "registerForm"),
              onPressed: () => navigatorKey.currentState!.pushNamed("lregisterForm"),
              child: const Text("Register"),
            ),
            Container(
              width: 25,
            ),
            ElevatedButton(
              // onPressed: () => Navigator.pushNamed(context, "loginForm"),
              onPressed: () => navigatorKey.currentState!.pushNamed("loginForm"),
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
