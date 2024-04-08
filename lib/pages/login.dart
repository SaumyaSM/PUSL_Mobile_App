import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mad_app/pages/SignUp.dart';
import 'package:mad_app/pages/forgotpassword.dart';
import 'package:mad_app/widget/widget_support.dart';

import 'bottomnav.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "", password = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  final _formkey = GlobalKey<FormState>();
  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar((SnackBar(
          backgroundColor: Colors.blueAccent,
          content: Text(
            "Login Successfull",
            style: TextStyle(fontSize: 20.0),
          ))));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomNav()));
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "No user found for that Email",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        )));
      } else if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Wrong Password",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.indigo])),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
              child: Text(""),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      "images/logo.png",
                      width: MediaQuery.of(context).size.width / 2,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30.0,
                            ),
                            Center(
                              child: Text(
                                "Login",
                                style: AppWidget.HeadLIneTextFieldStyle(),
                              ),
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter email";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: AppWidget.HintTextFieldStyle(),
                                  prefixIcon: Icon(Icons.email_outlined)),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            TextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter password";
                                }
                                return null;
                              },
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: AppWidget.HintTextFieldStyle(),
                                prefixIcon: Icon(Icons.password),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPassword()));
                              },
                              child: Container(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 15.0,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 75.0,
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (_formkey.currentState!.validate()) {
                                  setState(() {
                                    email = emailController.text;
                                    password = passwordController.text;
                                  });
                                }
                                userLogin();
                              },
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: Colors.indigoAccent,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text(
                                      "LOGIN",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      "Don't have an account? Sign Up",
                      style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 17.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
