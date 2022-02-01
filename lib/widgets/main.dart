import 'package:flutter/material.dart';
import 'package:flutterfire_auth/widgets/login.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: LoginWidget(),
    );
  }
}
