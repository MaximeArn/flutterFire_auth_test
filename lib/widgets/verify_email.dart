import 'package:flutter/material.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void sendNewVerificationLink(){

    }
    return Center(
      child: Column(
        children:  [
          const Text("You must verify your email to access the rest of the app"),
          ElevatedButton(onPressed: sendNewVerificationLink, child: const Text("Send new link")) 
        ],
      ),
    );
  }
}