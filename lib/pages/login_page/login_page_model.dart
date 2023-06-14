// Importing required Dart and Flutter packages.
import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fallora/widgets/dialog/dialogs.dart';
import 'package:fallora/widgets/text_form_field_state.dart';
import 'package:fallora/backend/auth/auth.manager.dart';
import 'package:fallora/backend/model/login/request/login_request.dart';
import 'package:fallora/backend/model/login/response/login_response.dart';
import 'package:fallora/backend/model/otp/sendotp/send_otp_request.dart';
import 'package:fallora/backend/model/register/request/register_request.dart';
import 'package:fallora/backend/repo/functions_repo.dart';
import 'package:fallora/backend/repo/local_repo.dart';
import 'package:fallora/backend/util/base_response.dart';
import 'package:form_validator/form_validator.dart';
// ignore: unused_import
import 'package:provider/provider.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

// LoginPageModel is the model class that handles the business logic for the login page.
class LoginPageModel extends FlutterFlowModel {
  // References to the functional repositories and authentication manager of the application.
  final FunctionsRepo functionsRepo;
  final LocalRepo localRepo;
  final AuthManager authManager;

  // LoginPageModel's constructor requires instances of FunctionRepo, LocalRepo, and AuthManager.
  LoginPageModel(
      {required this.functionsRepo,
      required this.localRepo,
      required this.authManager});

  // Node to handle unfocusing of fields.
  final unFocusNode = FocusNode();

  // Declaring global keys for form fields.
  final emailLoginFormField = GlobalKey<TextFormFieldState>();
  final passwordLoginFormField = GlobalKey<TextFormFieldState>();
  final usernameRegisterField = GlobalKey<TextFormFieldState>();
  final emailRegisterField = GlobalKey<TextFormFieldState>();
  final passwordRegisterField = GlobalKey<TextFormFieldState>();
  final passwordConfirmField = GlobalKey<TextFormFieldState>();

  // Form field validators
  // These will be used to validate the inputs on the form fields.
  get emailValidator =>
      ValidationBuilder(requiredMessage: "* E-posta boş olamaz")
          .email("* Geçerli bir e-posta giriniz")
          .maxLength(50)
          .build();

  get passwordValidator =>
      ValidationBuilder(requiredMessage: "* Parola boş olamaz").build();

  get usernameValidator =>
      ValidationBuilder(requiredMessage: "* Kullanıcı adı boş olamaz")
          .minLength(5, "* Minimum 5 harften oluşmalı")
          .build();

  get passwordRegisterValidator =>
      ValidationBuilder(requiredMessage: "* Parola boş olamaz")
          .minLength(6, "* Minimum 6 karakterden oluşmalı")
          .regExp(RegExp(".*[0-9].*"), "En az bir rakam içermeli")
          .build();

  get passwordConfirmValidator =>
      ValidationBuilder(requiredMessage: "* Parola boş olamaz")
          .add((value) => value == passwordRegisterController.text
              ? null
              : "* Parolalar eşleşmiyor")
          .build();

  // The login method which handles the login operation
  // It will check the form, build the request, and then call the login function from the functions repository.
  void login(BuildContext context) async {
    String email = emailLoginController.text.trim();
    String password = passwordLoginController.text;

    var emailError = emailLoginFormField.currentState?.validate();
    var passwordError = passwordLoginFormField.currentState?.validate();
    if (emailError == true || passwordError == true) return;
    var request = LoginRequest(email: email, password: password);
    FocusScope.of(context).requestFocus(unFocusNode);
    
    GoRouter.of(context).appState.updateNotifyOnAuthChange(true);
    safeCall(
        apiCall: () => functionsRepo.login(request).then((value) async {
            if (value.message == '{"error":"Email not verified"}') {
              await functionsRepo.sendOtp(SendOtpRequest(email: email));
              GoRouter.of(context).go("/OtpPage", extra: {"email": email});
            }
            return value;
          }
        ),
        callBack: (BaseResponse<LoginResponse> response) {
          var messageMap = response.message;
          switch (response.status) {
            case Status.SUCCESS:
              var successDialog = DialogBuilder.successDialogBuilder(
                  context, "Giriş Başarılı", null)
                ..show();
              Future.delayed(const Duration(seconds: 2), () {
                successDialog.dismiss();
                authManager.addValidToken(response.data?.idToken);
                GoRouter.of(context).pushNamed("/HomePage");
              });
              break;
            default:
              errorExtractor(context, messageMap!);
          }
        });
  }

  Map<String, String?> errorResponsesTR = {
    "Invalid email or password": "Hatalı email veya şifre",
    "User not found": "Kullanıcı bulunamadı",
    "default": "Bilinmeyen hata",
  };

  Future<AwesomeDialog?> errorExtractor(
      BuildContext context, String errorMessage) async {
    Map<String, dynamic> errorDecoded = jsonDecode(errorMessage);
    if (errorDecoded['error'] ==
        errorResponsesTR["Invalid email or password"]) {
      return DialogBuilder.errorDialogBuilder(
          context, "Hatalı email veya şifre")
        ..show();
    } else if (errorDecoded['error'] == errorResponsesTR["User not found"]) {
      return DialogBuilder.errorDialogBuilder(context, "Kullanıcı bulunamadı")
        ..show();
    } else {
      return DialogBuilder.errorDialogBuilder(
          context, errorResponsesTR["default"])
        ..show();
    }
  }

  // The register method which handles the registration operation
  // It validates form fields, builds the request, and calls the register function from the functions repository.
  void register(BuildContext context) {
    var usernameError = usernameRegisterField.currentState?.validate();
    var emailError = emailRegisterField.currentState?.validate();
    var passwordError = passwordRegisterField.currentState?.validate();
    var confirmError = passwordConfirmField.currentState?.validate();

    if (emailError == true ||
        passwordError == true ||
        confirmError == true ||
        usernameError == true) return;

    String fullname = usernameRegisterController.text;
    String email = emailRegisterController.text;
    String password = passwordRegisterController.text;
    var request =
        RegisterRequest(fullName: fullname, email: email, password: password);
    FocusScope.of(context).requestFocus(unFocusNode);

    safeCall(
      apiCall: () => functionsRepo.register(request).then((value) async {
        var result = await functionsRepo.sendOtp(SendOtpRequest(email: email));
        log(result.toString());
        return value;
      }),
      callBack: (BaseResponse<String?> response) async {
        switch (response.status) {
          case Status.SUCCESS:
            var dialog = DialogBuilder.successDialogBuilder(
                context, "Kayıt Başarılı", null);
            dialog.show();
            dialog.dismiss();
            GoRouter.of(context).go("/OtpPage", extra: {"email": email});
            break;
          default:
            DialogBuilder.errorDialogBuilder(context, response.message).show();
        }
      },
    );
  }

  // Declaring controllers for form fields
  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();
  final TextEditingController usernameRegisterController =
      TextEditingController();
  final TextEditingController emailRegisterController = TextEditingController();
  final TextEditingController passwordRegisterController =
      TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  // Dispose method to clean up the controllers when the widget is removed from the widget tree
  void dispose() {
    emailLoginController.dispose();
    passwordLoginController.dispose();
    emailRegisterController.dispose();
    passwordRegisterController.dispose();
    passwordConfirmController.dispose();
  }

  // This method will be called when the model is initialized.
  @override
  void initState(BuildContext context) {}
}
