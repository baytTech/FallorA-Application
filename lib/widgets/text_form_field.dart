import 'package:fallora/widgets/text_form_field_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextFormFieldType type;
  final TextInputAction textInputAction;
  final bool obscureText;
  final String hintText;
  final String? Function(String? params)? validator;
  final bool showEmptyButton;
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.type = TextFormFieldType.TEXT,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    required this.hintText,
    this.validator,
    this.showEmptyButton = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState
    extends TextFormFieldState<CustomTextFormField> {
  String? errorText;
  bool isPassword = false;
  Iterable<String>? autofillHints;
  TextInputType? keyboardType;
  Widget? prefixIcon;
  FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {});
    });
    switch (widget.type) {
      case TextFormFieldType.EMAIL:
        autofillHints = const <String>[AutofillHints.email];
        keyboardType = TextInputType.emailAddress;
        prefixIcon = SvgPicture.asset("./assets/images/mail.svg");
        break;
      case TextFormFieldType.TEXT:
        keyboardType = TextInputType.text;
        break;
      case TextFormFieldType.NAME:
        autofillHints = const <String>[AutofillHints.name];
        keyboardType = TextInputType.text;
        prefixIcon = SvgPicture.asset("./assets/images/user.svg");
        break;
      case TextFormFieldType.PASSWORD:
        isPassword = true;
        passwordVisibility = true;
        autofillHints = const <String>[AutofillHints.password];
        keyboardType = TextInputType.visiblePassword;
        prefixIcon = SvgPicture.asset("./assets/images/padlock.svg");
        break;
    }
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  final errorColor = const Color(0xFFF43D62);

  OutlineInputBorder get errorBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: errorColor, width: 1));

  OutlineInputBorder get focusedBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Color(0xFF004ECB), width: 1));

  OutlineInputBorder get normalBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      );

  TextStyle get hintStyle => FlutterFlowTheme.of(context).bodyMedium.override(
        fontFamily: 'Lexend Deca',
        color: Color(0xFF95A1AC),
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        useGoogleFonts: GoogleFonts.asMap()
            .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
      );

  bool passwordVisibility = false;

  Widget suffixIcon(bool value) => InkWell(
        onTap: () => setState(() {
          passwordVisibility = !value;
        }),
        child: Icon(
            !passwordVisibility
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Color(0xFF95A1AC),
            size: 20.0),
      );

  bool get onError => errorText != null;

  @override
  Widget build(BuildContext context) {
    EdgeInsets? contentPadding = onError
        ? const EdgeInsets.fromLTRB(12, 22, 12, 36)
        : const EdgeInsets.fromLTRB(12, 22, 12, 22);

    var textStyle = FlutterFlowTheme.of(context).titleSmall.override(
          fontFamily: 'Outfit',
          color: Color(0xFF0F1113),
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
          useGoogleFonts: GoogleFonts.asMap()
              .containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
        );

    return Stack(
      children: [
        TextFormField(
          focusNode: _focusNode,
          controller: widget.controller,
          autocorrect: false,
          obscureText: passwordVisibility,
          autofillHints: autofillHints,
          keyboardType: keyboardType,
          maxLines: 1,
          textInputAction: widget.textInputAction,
          style: textStyle,
          onChanged: (value) {
            setState(() {
              errorText = null;
            });
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            filled: true,
            contentPadding: contentPadding,
            fillColor: Colors.white,
            hintStyle: hintStyle,
            errorBorder: OutlineInputBorder(),
            border: normalBorder,
            focusedBorder: onError ? errorBorder : focusedBorder,
            suffixIcon: widget.showEmptyButton && _focusNode.hasFocus
                ? IconButton(
                    icon:
                        Icon(Icons.clear, color: Color(0xFF95A1AC), size: 20.0),
                    onPressed: () => widget.controller.clear(),
                  )
                : isPassword
                    ? suffixIcon(passwordVisibility)
                    : null,
          ),
        ),
        if (onError) ...[
          Positioned(
              bottom: 4,
              left: 12,
              child: Text(errorText ?? "",
                  style: TextStyle(color: errorColor, fontSize: 10)))
        ]
      ],
    );
  }

  @override
  void reset() {
    errorText = null;
    update();
  }

  @override
  bool validate() {
    errorText = widget.validator?.call(widget.controller.text);
    update();
    return onError;
  }

  @override
  void update() {
    setState(() {});
  }
}

enum TextFormFieldType { EMAIL, TEXT, NAME, PASSWORD }
