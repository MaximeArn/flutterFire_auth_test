import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_auth/types/authentication.dart';
import 'package:flutter/material.dart';

class AuthenticationForm extends StatefulWidget {
  final AuthenticationMethod method;
  const AuthenticationForm({Key? key, required this.method}) : super(key: key);

  @override
  _AuthenticationFormState createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  final authInstance = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late AuthenticationStatus _status;
  late String? _message;
  late User? _user;

  @override
  void initState() {
    super.initState();
    _status = AuthenticationStatus.byDefault;
    _message = null;
    _user = null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _logIn() async {
    try {
      _user = (await authInstance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
      _message = "Well loged in";
    } on FirebaseAuthException catch (e) {
      _message = e.message;
    }
    setState(
      () {
        _status = _user != null
            ? AuthenticationStatus.successed
            : AuthenticationStatus.failed;
      },
    );
  }

  void _register() async {
    try {
      _user = (await authInstance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;

      setState(() {
        _message = "Well registered !";
        _status = AuthenticationStatus.successed;
      });

      if (_user != null )await _user!.sendEmailVerification();
      
    } on FirebaseAuthException catch (e) {
      setState(
        () {
          _status = AuthenticationStatus.failed;
          _message = e.message;
        },
      );
    }
  }

  displayMessage() => Container(
        alignment: Alignment.center,
        child: Text(
          _message ?? "",
          style: TextStyle(
              color: _status == AuthenticationStatus.failed
                  ? Colors.red.shade400
                  : Colors.green.shade600),
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
                    value!.trim().isEmpty ? 'Please enter some text' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (String? value) =>
                    value!.trim().isEmpty ? 'Please enter some text' : null,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.center,
                child: _status == AuthenticationStatus.pending
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _status = AuthenticationStatus.pending;
                            });
                            _user = null;
                            _message = null;
                            widget.method == AuthenticationMethod.registration
                                ? _register()
                                : _logIn();
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
