import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  String label;
  
  PasswordField({Key? key, required this.controller, this.label = "Password"}) : super(key: key);

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<PasswordField> {
  bool isPasswordHidden = true;

  void toggleVisibility() =>
      setState(() => isPasswordHidden = !isPasswordHidden);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (password) => password != null && password.length < 6
          ? "Password must contain at least 6 characters"
          : null,
      controller: widget.controller,
      obscureText: isPasswordHidden,
      textInputAction: TextInputAction.done,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        suffix: InkWell(
          onTap: toggleVisibility,
          child: Icon(
            isPasswordHidden ? Icons.visibility_off : Icons.visibility,
            color: Colors.white,
          ),
        ),
        labelStyle: const TextStyle(color: Colors.white),
        labelText: widget.label,
        focusColor: Colors.white,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
