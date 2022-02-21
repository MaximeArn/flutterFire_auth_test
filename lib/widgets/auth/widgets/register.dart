import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_auth/utils.dart';
import 'package:flutterfire_auth/widgets/auth/widgets/text_fields/password_field.dart';

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
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;

  dynamic comparePasswords() {
    final bool isIdentical =
        passwordController.text == confirmPasswordController.text;
    if (!isIdentical) {
      throw FirebaseAuthException(
        code: "different_passwords",
        message: "Passwords must be identical",
      );
    }
  }

  Future<void> register() async {
    final formIsValid = formKey.currentState!.validate();
    if (!formIsValid) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      comparePasswords();
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(text: e.message);
    }

    Utils.navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
             Image.asset(
            "assets/cooking_logo.png",
            height: 150,
          ),
          const SizedBox(height: 10,),
            const Text(
              'Welcome \n On Cooking !',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? "Enter a valid email"
                      : null,
              autocorrect: false,
              controller: emailController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PasswordField(controller: passwordController),
            const SizedBox(
              height: 20,
            ),
            PasswordField(
              controller: confirmPasswordController,
              label: "Confirm Password",
            ),
            const SizedBox(
              height: 50,
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
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onLogInClicked,
                    text: "Log In",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
