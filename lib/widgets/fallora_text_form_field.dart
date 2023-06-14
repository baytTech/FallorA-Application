import 'dart:math';

import 'package:fallora/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'animation_controller_state.dart';

// ignore: must_be_immutable
class FalloraTextFormField extends StatefulWidget {
  TextEditingController? controller;
  String? Function(BuildContext, String?)? validator;
  String? label;
  Widget? suffixIcon;
  FocusNode? focusNode;
  FalloraTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.label,
    this.obscureText = false,
    this.suffixIcon,
    this.focusNode,
  });
  bool obscureText = false;

  @override
  State<FalloraTextFormField> createState() =>
      FalloraTextFormFieldState(Duration(milliseconds: 400));
}

class FalloraTextFormFieldState
    extends AnimationControllerState<FalloraTextFormField> {
  FalloraTextFormFieldState(super.animationDuration);

  @override
  void initState() {
    animationController.addStatusListener(_updateAnimationStatus);
    super.initState();
  }

  @override
  void dispose() {
    animationController.removeStatusListener(_updateAnimationStatus);
    super.dispose();
  }

  void _updateAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.reset();
    }
  }

  void shakeWidget() {
    animationController.forward();
  }

  final shakeCount = 3;
  final shakeOffset = 10;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        final sineValue = sin(shakeCount * 2 * pi * animationController.value);
        return Transform.translate(
          offset: Offset(sineValue * shakeOffset, 0),
          child: child,
        );
      },
      animation: animationController,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          //labelText: widget.label,
          hintText: widget.label,
          labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Poppins',
                color: Color(0xFF95A1AC),
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
          hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF95A1AC),
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x00000000), width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x00000000), width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x00000000), width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
        ),
        focusNode: widget.focusNode,
        style: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Outfit',
              color: Color(0xFF0F1113),
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
            ),
        maxLines: 1,
        validator: widget.validator.asValidator(context),
      ),
    );
  }
}
