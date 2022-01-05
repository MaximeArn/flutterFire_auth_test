import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_auth/types/Authentication.dart';


class EmailRegistration extends StatefulWidget {
  final FirebaseAuth auth;
  const EmailRegistration({Key? key, required this.auth}) : super(key: key);

  @override
  _EmailRegistrationState createState() => _EmailRegistrationState();
}

class _EmailRegistrationState extends State<EmailRegistration> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  RegistrationStatus _status = RegistrationStatus.byDefault;
  late String? _userEmail;

  void _register() async {
    final User? user = (await widget.auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _status = RegistrationStatus.successed;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _status = RegistrationStatus.successed;
      });
    }
  }

  displayMessage() => Container(
        alignment: Alignment.center,
        child: Text(
          _status == RegistrationStatus.successed
              ? 'Successfully registered ' + _userEmail.toString()
              : 'Registration failed',
        ),
      );

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
                  _register();
                }
              },
              child: const Text('Submit'),
            ),
          ),
          if (_status != RegistrationStatus.byDefault) displayMessage()
        ],
      ),
    );
  }
}
