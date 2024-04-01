import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget {
  static TextStyle boldTextFieldStyle() {
    return GoogleFonts.laila(
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle HeadLIneTextFieldStyle() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
          color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }

  static TextStyle LightTextFieldStyle() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
          color: Colors.black38, fontSize: 15.0, fontWeight: FontWeight.w600),
    );
  }

  static TextStyle SemiboldTextFieldStyle() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle HintTextFieldStyle() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: Colors.black38,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
