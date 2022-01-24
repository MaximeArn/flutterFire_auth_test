import 'dart:async';
import 'package:flutterfire_auth/types/authentication.dart';
import 'package:flutterfire_auth/widgets/auth_form.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  late StreamSubscription<User?> _sub;

  void popAndRemplace() async {
    await _navigatorKey.currentState!.maybePop();
    _navigatorKey.currentState!.pushReplacementNamed(Connected.routeName);
  }

  @override
  void initState() {
    super.initState();
    _sub = FirebaseAuth.instance.authStateChanges().listen((user) {
      print(user == null ? "Disconnected !" : "Connected !");
      if (user != null) {
        popAndRemplace();
      } else {
        _navigatorKey.currentState!
            .pushReplacementNamed(NotConnected.routeName);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _sub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
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
              builder: (context) => NotConnected(
                navigatorKey: _navigatorKey,
              ),
            );
          default:
        }
      },
      routes: {
        "loginForm": (_) => const AuthenticationForm(
              method: AuthenticationMethod.connection,
            ),
        "registerRegister": (_) =>
            const AuthenticationForm(method: AuthenticationMethod.registration),
      },
    );
  }
}
