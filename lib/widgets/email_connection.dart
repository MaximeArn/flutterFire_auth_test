import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_auth/types/authentication.dart';

class EmailConnection extends StatefulWidget {
  final FirebaseAuth auth;
  const EmailConnection({Key? key, required this.auth}) : super(key: key);

  @override
  _EmailConnectionState createState() => _EmailConnectionState();
}

class _EmailConnectionState extends State<EmailConnection> {
  //TODO: refactorize the whole component that is almost identical to the register form

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthenticationStatus _status = AuthenticationStatus.byDefault;
  late String? _userEmail;

  displayMessage() => Container(
        alignment: Alignment.center,
        child: Text(
          _status == AuthenticationStatus.successed
              ? ' Successfully loged in ' + _userEmail.toString()
              : ' failed',
        ),
      );

  void _signInWithEmailAndPassword() async {
    final User? user = (await widget.auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;

    if (user != null) {
      setState(() {
        _status = AuthenticationStatus.successed;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _status = AuthenticationStatus.failed;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // _logIn();
                }
              },
              child: const Text('Submit'),
            ),
          ),
          if (_status != AuthenticationStatus.byDefault) displayMessage()
        ],
      ),
    );
  }
}
