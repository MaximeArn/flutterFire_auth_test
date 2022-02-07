import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterWidget extends StatefulWidget {
  final VoidCallback onLogInClicked;
  const RegisterWidget({
    Key? key,
    required this.onLogInClicked,
  }) : super(key: key);

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> register() async {}

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
            height: 60,
          ), 
          Image.asset("assets/tree_logo.png", height: 250,),
          const Text(
            'Hello \n Welcome on Cooking !',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 26, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 60,
          ),
          TextFormField(
            autocorrect: false,
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
                minimumSize: const Size.fromHeight(50)),
            onPressed: register,
            icon: const Icon(Icons.login),
            label: const Text(
              "Register",
              style: TextStyle(fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          RichText(
            text: TextSpan(
              text: "Already have an account ? ",
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = widget.onLogInClicked,
                  text: "Log In",
                  style: TextStyle(
                    color: Colors.green.shade400,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
