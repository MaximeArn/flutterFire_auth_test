import 'package:flutter/material.dart';

class NotConnectedView extends StatelessWidget {
  const NotConnectedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("You are not loged in !"),
    );
  }
}
