import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mad_app/pages/SignUp.dart';
import 'package:mad_app/pages/bottomnav.dart';
import 'package:mad_app/pages/home.dart';
import 'package:mad_app/pages/login.dart';
import 'package:mad_app/pages/onboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BusinessApp());
}

class BusinessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: SignUp(),
    );
  }
}
