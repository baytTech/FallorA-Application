import 'package:fallora/widgets/text_form_field_state.dart';
import 'package:form_validator/form_validator.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class ForgotPasswordModel extends FlutterFlowModel {
  final TextEditingController emailController = TextEditingController();
  final emailFormField = GlobalKey<TextFormFieldState>();

  get emailValidator =>
      ValidationBuilder(requiredMessage: "❌ E-posta boş olamaz")
          .email("❌ Geçerli bir e-posta giriniz")
          .maxLength(50)
          .build();

  void initState(BuildContext context) {}

  void submit(BuildContext context) {
    if (emailFormField.currentState?.validate() == false) return;
  }

  void dispose() {
    emailController.dispose();
  }
}
