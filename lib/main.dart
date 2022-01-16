import 'package:flutterfire_auth/types/authentication.dart';
import 'package:flutterfire_auth/widgets/auth_form.dart';

import 'firebase_options.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:flutter/material.dart';
import 'package:flutterfire_auth/widgets/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // First tests to manage auth states changes
  auth.authStateChanges().listen(
      (user) => user == null ? print("disconnected") : print("well connected"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Auth Test',
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => HomePage(
              auth: auth,
            ),
        "registerForm": (_) => AuthenticationForm(
            method: AuthenticationMethod.registration, auth: auth),
        "loginForm": (_) => AuthenticationForm(
            method: AuthenticationMethod.connection, auth: auth)
      },
    );
  }
}
