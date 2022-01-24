import 'package:flutterfire_auth/widgets/landing/widgets/connected_view.dart';
import 'package:flutterfire_auth/widgets/landing/widgets/not_connected_view.dart';

import 'firebase_options.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // First tests to manage auth states changes
  FirebaseAuth.instance.authStateChanges().listen(
        (user) => {
          if (user == null)
            {
              print("disconnected"),
            }
          else
            {
              print("well connected"),
            }
        },
      );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Auth Intro',
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? NotConnected.routeName
          : Connected.routeName,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case Connected.routeName:
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => const Connected(),
            );

          case NotConnected.routeName:
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => const NotConnected(),
            );
          default:
        }
      },
    );
  }
}
