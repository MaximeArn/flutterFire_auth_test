import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_auth/types/authentication.dart';
import 'package:flutterfire_auth/widgets/auth_form.dart';

class NotConnectedView extends StatefulWidget {
  final FirebaseAuth auth;
  const NotConnectedView({Key? key, required this.auth}) : super(key: key);

  @override
  _NotConnectedViewState createState() => _NotConnectedViewState();
}

class _NotConnectedViewState extends State<NotConnectedView> {
  late AuthenticationMethod? content;

  @override
  void initState() {
    super.initState();
    content = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth test"),
      ),
      body: content == AuthenticationMethod.registration
          ? AuthenticationForm(
              auth: widget.auth,
              method: AuthenticationMethod.registration,
            )
          : content == AuthenticationMethod.connection
              ? AuthenticationForm(
                  method: AuthenticationMethod.connection, auth: widget.auth)
              : Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, "registerForm"),
                        child: const Text("Register"),
                      ),
                      Container(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, "loginForm"),
                        child: const Text("Login"),
                      ),
                    ],
                  ),
                ),
    );
  }
}
