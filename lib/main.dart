import 'dart:async';
import 'firebase_options.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutterfire_auth/types/authentication.dart';
import 'package:flutterfire_auth/widgets/auth_form.dart';
import 'package:flutterfire_auth/widgets/connected_view.dart';
import 'package:flutterfire_auth/widgets/not_connected_view.dart';
import 'package:flutterfire_auth/widgets/unknown_route.dart';
import 'package:flutterfire_auth/widgets/verify_email.dart';

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

  void authChangesRouteHandler({User? user}) async {
    final navigator = _navigatorKey.currentState!;
    if (user == null) {
      navigator.pushReplacementNamed(NotConnected.routeName);
    } else {
      print(user.emailVerified);
      navigator.maybePop();
      navigator.pushReplacementNamed(Connected.routeName);
    }
  }

  @override
  void initState() {
    super.initState();
    _sub = FirebaseAuth.instance
        .authStateChanges()
        .listen((user) => authChangesRouteHandler(user: user));
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
      initialRoute: "/",
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (_) => const UnknownRoute()),
      routes: {
        "/": (_) => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        "loginForm": (_) => const AuthenticationForm(
              method: AuthenticationMethod.connection,
            ),
        "registerForm": (_) =>
            const AuthenticationForm(method: AuthenticationMethod.registration),
        VerifyEmail.routeName: (_) => const VerifyEmail(),
        NotConnected.routeName: (_) => const NotConnected(),
        Connected.routeName: (_) => const Connected(),
      },
    );
  }
}
