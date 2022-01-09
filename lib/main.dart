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
        "/": (BuildContext context) => HomePage(auth: auth,),
        "registerForm": (BuildContext constext) => AuthenticationForm(method: AuthenticationMethod.registration, auth: auth),
        "loginForm": (BuildContext context) => AuthenticationForm(method: AuthenticationMethod.connection, auth: auth) 
      },
    );
  }
}
