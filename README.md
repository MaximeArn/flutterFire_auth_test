# **flutterfire authentication**

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

install dependency --> `flutter pub get firebase_auth`

rebuild app -- `flutter run`

import the package --> `import 'package:firebase_auth/firebase_auth.dart';`

<br>
<br>

## **Usage**

To use firebase_auth methods we need an instance that is the entrypoint of the service.

```dart
final FirebaseAuth _auth = FirebaseAuth.instance;
```

<br>
<br>

### **Registration**

To register a user using email and password firebase let us use the `createUserWithEmailAndPassword` method

```dart
await auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )
```

This method return a UserCredentials instance that contain a User object with user's data
The `createUserWithEmailAndPassword` method check itself the strength of the password or the email format.

<br>
<br>

### **Log in**

the method used to log in a user is called `signInWithEmailAndPassword` it takes email and password and return a UserCredential instance too (if everything went well)

```dart
await widget.auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )
```

<br>
<br>

### **Log out**

The sign-out function is simply called `signgOut` and does not require any parameter. it is a method of the FirebaseAuth instance class.

```dart
    void logOut() async {
      final User? user = auth.currentUser;
      if (user == null) {
        showSnackBar(message: "No one has signed in !");
      } else {
        await auth.signOut();
        final String? email = user.email;
        showSnackBar(message: "$email has successfully signed out !");
      }
    }
```

<br>
<br>

## **State management**

In an app most of the time we need to know when the auth state of the user chages. To do it firebase provide among others `authStateChanges()`. This method retun a Stream
