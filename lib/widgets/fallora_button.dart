import 'package:fallora/flutter_flow/flutter_flow_theme.dart';
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
      onPressed: onPressed,
      text: title.toString(),
      options: FFButtonOptions(
        width: width,
        height: height,
        color: enabled ? AppColors.secondaryColor : AppColors.secondaryColor.withOpacity(0.3) ,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
          fontFamily: 'Lexend Deca',
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
          useGoogleFonts: GoogleFonts.asMap()
            .containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
        ),
        elevation: 3.0,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
      ),
    );
  }
}
