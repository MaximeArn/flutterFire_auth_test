import 'package:flutter/material.dart';
import 'package:flutterfire_auth/types/Authentication.dart';

class EmailConnection extends StatefulWidget {
  const EmailConnection({Key? key}) : super(key: key);

  @override
  _EmailConnectionState createState() => _EmailConnectionState();
}

class _EmailConnectionState extends State<EmailConnection> {

  //TODO: refactorize the whole component that is almost identical to the register form

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  RegistrationStatus _status = RegistrationStatus.byDefault;
  late String _userEmail;

  displayMessage() => Container(
        alignment: Alignment.center,
        child: Text(
          _status == RegistrationStatus.successed
              ? ' Successfully loged in ' + _userEmail.toString()
              : ' failed',
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
                  // _logIn();
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
 