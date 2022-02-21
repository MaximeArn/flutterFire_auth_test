import 'package:firebase_auth/firebase_auth.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:flutter/material.dart';
import 'package:flutterfire_auth/themes.dart';
import 'firebase_options.dart';

import 'package:flutterfire_auth/utils.dart';
import 'package:flutterfire_auth/widgets/auth/auth.dart';
import 'package:flutterfire_auth/widgets/auth/verify_email.dart';
import 'package:flutterfire_auth/widgets/unknown_route.dart';

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      navigatorKey: Utils.navigatorKey,
      scaffoldMessengerKey: Utils.messengerKey,
      title: 'Firebase Auth Intro',
      home: const MainPage(),
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => const UnknownRoute()),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : snapshot.hasError
                    ? const Center(child: Text("Oops Something went wrong"))
                    : snapshot.hasData
                        ? const VerifyEmail()
                        : const AuthPage();
          }),
    );
  }
}
