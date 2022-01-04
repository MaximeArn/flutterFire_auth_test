import 'firebase_options.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutterfire_auth/widgets/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //these options are directly inmported from `firebase_options.dart` which was generated on `flutterfire configure` command
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
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
