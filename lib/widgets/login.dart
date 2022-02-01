import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          TextFormField(
            controller: emailController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelStyle: TextStyle(color: Colors.white),
              labelText: "Email",
              focusColor: Colors.white,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            textInputAction: TextInputAction.done,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelStyle: TextStyle(color: Colors.white),
              labelText: "Password",
              focusColor: Colors.white,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50)
            ),
            onPressed: () {},
            icon: const Icon(Icons.login),
            label: const Text("Sign in"),
          ),
        ],
      ),
    );
  }
}
