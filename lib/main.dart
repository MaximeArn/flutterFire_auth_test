import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_auth/widgets/home.dart';
import 'package:flutterfire_auth/widgets/login.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:flutter/material.dart';
import 'firebase_options.dart';

import 'package:flutterfire_auth/widgets/unknown_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.green.shade400),
        backgroundColor: Colors.grey.shade800,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green.shade400),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
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
      backgroundColor: Theme.of(context).backgroundColor,
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
                        ? HomePage(navigatorKey: navigatorKey,)
                        : LoginWidget(navigatorKey: navigatorKey,);
          }),
    );
  }
}
