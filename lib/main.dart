import 'firebase_options.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutterfire_auth/widgets/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
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
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Auth Test',
      home: HomePage(),
    );
  }
}
