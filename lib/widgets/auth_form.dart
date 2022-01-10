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
  late String? _message;
  late User? _user;

  @override
  void initState() {
    super.initState();
    _message = null;
    _user = null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //TODO: try to make only one method for login and register because the are almost identical
  void _signInWithEmailAndPassword() async {
    try {
      _user = (await widget.auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
    } on FirebaseAuthException catch (e) {
      _message = e.message;
    }

    setState(() {
      _status = _user != null
          ? AuthenticationStatus.successed
          : AuthenticationStatus.failed;
    });
  }

  void _register() async {
    try {
      _user = (await widget.auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
    } on FirebaseAuthException catch (e) {
      _message = e.message;
    }

    setState(() {
      _status = AuthenticationStatus.successed;
    });
  }

  displayMessage() => Container(
        alignment: Alignment.center,
        child: Text(
          _message ?? "",
          style: TextStyle(color: Colors.red.shade400),
          textAlign: TextAlign.center,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Authentication"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (String? value) =>
                    value!.isEmpty ? 'Please enter some text' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (String? value) =>
                    value!.isEmpty ? 'Please enter some text' : null,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.center,
                child: _status == AuthenticationStatus.pending
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _status = AuthenticationStatus.pending;
                            });
                            _message = null;
                            widget.method == AuthenticationMethod.registration
                                ? _register()
                                : _signInWithEmailAndPassword();
                          }
                        },
                        child: const Text('Submit'),
                      ),
              ),
              if (_status != AuthenticationStatus.byDefault &&
                  _status != AuthenticationStatus.pending)
                displayMessage()
            ],
          ),
        ),
      ),
    );
  }
}
