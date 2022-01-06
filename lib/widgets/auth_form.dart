import 'package:flutter/material.dart';
import 'package:flutterfire_auth/types/authentication.dart';

class AuthenticationForm extends StatefulWidget {
  final AuthenticationMethod method;
  const AuthenticationForm({Key? key, required this.method}) : super(key: key);

  @override
  _AuthenticationFormState createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
