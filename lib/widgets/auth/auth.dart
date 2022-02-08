import 'package:flutter/material.dart';
import 'package:flutterfire_auth/widgets/auth/widgets/login.dart';
import 'package:flutterfire_auth/widgets/auth/widgets/register.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  void toggle() => setState(() => isLogin = !isLogin);

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? LoginWidget(
            onRegisterClicked: toggle,
          )
        : RegisterWidget(
            onLogInClicked: toggle,
          );
  }
}
