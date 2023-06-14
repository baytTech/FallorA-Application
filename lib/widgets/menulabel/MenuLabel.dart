import 'package:fallora/res/color.res.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuLabel extends StatelessWidget {

  final String text;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  
  const MenuLabel({super.key, 
    required this.text, 
    this.alignment, 
    this.padding
  });

  get font => 
    GoogleFonts.playfairDisplay(
      color: AppColors.white, 
      fontSize: 24, 
      fontWeight: FontWeight.normal
    );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment?? AlignmentDirectional(0.0, 1.0),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: text[0],
            ),
            TextSpan(
              text: text.substring(1,text.length),
              style: TextStyle(fontSize: 20.0),
            )
          ], style: font),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
