import 'package:fallora/res/color.res.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../flutter_flow/flutter_flow_widgets.dart';

class FalloraButton extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  final double width;
  final double height;
  final bool enabled;

  const FalloraButton({
    super.key,
    this.onPressed,
    this.title,
    this.width = 230,
    this.height = 50, 
    this.enabled = true
  });

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: enabled ? onPressed : null,
      text: title.toString(),
      options: FFButtonOptions(
        width: width,
        height: height,
        color: enabled ? AppColors.secondaryColor :  AppColors.secondaryColor.withOpacity(0.4),
        textStyle: GoogleFonts.lexendDeca(
          color: enabled ? Colors.white : Colors.white70,
          fontSize: 16.0,
        ),
        elevation: enabled ? 3.0 : 0,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
      ),
    );
  }
}
