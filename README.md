# **flutterfire_auth**

Project to set a full authentication system in a flutter app

## **Prerequisites**

<br>

install `firebase_core` that is responsible to connect the app to firebase services

Activate the `flutterfire_cli` --> `dart pub global activate flutterfire_cli`

configure the application for using firebase services declared in the firebase project --> `flutterfire configure`

## **Initialization**

### **How does it works**

<br>

_To sign a user into your app, you first get authentication credentials from the user. These credentials can be the user's email address and password, or an OAuth token from a federated identity provider. Then, you pass these credentials to the Firebase Authentication SDK. Our backend services will then verify those credentials and return a response to the client. After a successful sign in, you can access the user's basic profile information, and you can control the user's access to data stored in other Firebase products. You can also use the provided authentication token to verify the identity of users in your own backend services._

<br>

Before using firebase services we need to initialize the app by passing generated options

<br>

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //these options are directly inmported from `firebase_options.dart` which was generated on `flutterfire configure` command
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
```

## **firebase_auth**

install dependency --> `flutter pub get firebase_auth`

rebuild app -- `flutter run`

import the package --> `import 'package:firebase_auth/firebase_auth.dart';`
