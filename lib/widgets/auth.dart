import 'package:flutter/material.dart';
import 'package:flutterfire_auth/widgets/login.dart';
import 'package:flutterfire_auth/widgets/register.dart';

class AuthPage extends StatefulWidget {
  final navigatorKey;
  const AuthPage({
    Key? key,
    required this.navigatorKey,
  }) : super(key: key);

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
            navigatorKey: widget.navigatorKey, onRegisterClicked: toggle)
        : RegisterWidget();
  }
}
