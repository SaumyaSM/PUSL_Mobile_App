import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mad_app/admin/admin_login.dart';
import 'package:mad_app/pages/SignUp.dart';
import 'package:mad_app/pages/bottomnav.dart';
import 'package:mad_app/pages/forgotpassword.dart';
import 'package:mad_app/pages/home.dart';
import 'package:mad_app/pages/login.dart';
import 'package:mad_app/pages/onboard.dart';
import 'package:mad_app/pages/wallet.dart';
import 'package:mad_app/widget/app_constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = publishableKey;
  await Firebase.initializeApp();
  runApp(BusinessApp());
}

class BusinessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: AdminLogin(),
    );
  }
}
