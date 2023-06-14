import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninwithGoogleWidget extends StatelessWidget {
  const SigninwithGoogleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var googleIcon = "./assets/images/google.png";
    return FFButtonWidget(
      onPressed: () {},
      text: 'Google',
      icon: Image.asset(googleIcon,fit: BoxFit.contain,height: 18),
      options: FFButtonOptions(
        height: 44.0,
        color: Colors.white,
        textStyle: GoogleFonts.getFont('Roboto',color: Colors.black,fontSize: 14.0),
        elevation: 4.0,
      ),
    );
  }
}