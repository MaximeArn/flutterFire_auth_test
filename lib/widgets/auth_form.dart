import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_auth/types/authentication.dart';
import 'package:flutter/material.dart';

class AuthenticationForm extends StatefulWidget {
  final AuthenticationMethod method;
  final FirebaseAuth auth;
  const AuthenticationForm({Key? key, required this.method, required this.auth})
      : super(key: key);

  @override
  _AuthenticationFormState createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthenticationStatus _status = AuthenticationStatus.byDefault;
  late String? _userEmail;

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

  void _register() async {
    final User? user = (await widget.auth.createUserWithEmailAndPassword(
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
        _status = AuthenticationStatus.successed;
      });
    }
  }

  //TODO: update this method to match as well as connection and registration
  displayMessage() => Container(
        alignment: Alignment.center,
        child: Text(
          _status == AuthenticationStatus.successed
              ? 'Successfully registered ' + _userEmail.toString()
              : 'Registration failed',
        ),
      );

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
                  print(widget.method == AuthenticationMethod.connection);
                  print(widget.method == AuthenticationMethod.registration);
                  widget.method == AuthenticationMethod.registration
                      ? _register()
                      : _signInWithEmailAndPassword();
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
