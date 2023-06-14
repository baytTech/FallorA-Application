import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninwithAppleWidget extends StatelessWidget {
  const SigninwithAppleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appleIcon = "./assets/images/apple.png";

    return FFButtonWidget(
      onPressed: () {},
      text: 'Apple',
      icon: Image.asset(appleIcon,fit: BoxFit.contain,height: 18),
      options: FFButtonOptions(
        height: 44.0,
        color: Colors.white,
        textStyle: GoogleFonts.getFont('Roboto',color: Colors.black,fontSize: 14.0),
        elevation: 4.0,
      ),
    );
  }
}
