import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mad_app/pages/SignUp.dart';
import 'package:mad_app/widget/widget_support.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email = "";
  TextEditingController emailController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar((SnackBar(
          backgroundColor: Colors.blueAccent,
          content: Text(
            "Password reset email has been sent",
            style: TextStyle(fontSize: 15.0),
          ))));
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "No user found for that Email",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(children: [
          SizedBox(
            height: 70.0,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              "Password Recovery",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Enter your email",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: Form(
            key: _formkey,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white70, width: 2.0),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Email';
                        }
                      },
                      style: TextStyle(color: Colors.white70),
                      decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle:
                              TextStyle(color: Colors.white70, fontSize: 18.0),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.white70,
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          email = emailController.text;
                        });
                        resetPassword();
                      }
                    },
                    child: Container(
                      width: 200,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Center(
                        child: Text(
                          "Send Email",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 15.0, color: Colors.white70),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: Text(
                          "Create",
                          style: TextStyle(
                              fontSize: 15.0, color: Colors.lightBlueAccent),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ))
        ]),
      ),
    );
  }
}
