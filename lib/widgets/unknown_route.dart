import 'package:flutter/material.dart';

class UnknownRoute extends StatelessWidget {
  const UnknownRoute({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: const Text("Authentication"),
      ),
      body: const Center(
        child: Text("Sorry but this page does not exist !"),
      ),
    );
  }
}