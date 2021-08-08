import 'package:easy_login/screens/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(EasyLoginApp());
}

class EasyLoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easy login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EasyLogin(),
    );
  }
}

class EasyLogin extends StatefulWidget {
  EasyLogin({Key key}) : super(key: key);

  @override
  _EasyLoginState createState() => _EasyLoginState();
}

class _EasyLoginState extends State<EasyLogin> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}
