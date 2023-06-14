
import 'dart:async';
import 'package:fallora/backend/model/otp/verifyotp/verify_otp_request.dart';
import 'package:fallora/backend/repo/functions_repo.dart';
import 'package:fallora/backend/repo/local_repo.dart';
import 'package:fallora/backend/util/base_response.dart';
import 'package:fallora/flutter_flow/flutter_flow_model.dart';
import 'package:fallora/widgets/numberpad/controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ValidationViewModel extends FlutterFlowModel {
  final FunctionsRepo functionsRepo;
  final LocalRepo localRepo;
  final NumberPadController numberPadController = NumberPadController();
  final errorController = StreamController<ErrorAnimationType>();

  String email = "";

  ValidationViewModel({ 
    required this.functionsRepo, 
    required this.localRepo
  });


  void verifyOtp(BuildContext context) {
    var request = VerifyOtpRequest(email: email, otp: numberPadController.value);
    safeCall(
      apiCall: () => functionsRepo.verifyOtp(request),
      callBack: (BaseResponse<String?> response) async {
        switch (response.status) {
          case Status.SUCCESS: 
            GoRouter.of(context).go("/SuccessPage");
            break;
          default: 
            errorController.add(ErrorAnimationType.shake);
            //DialogBuilder.errorDialogBuilder(context, response.message).show();
        }
        
      },
    );
  }

  @override
  void dispose() {
    errorController.close();
  }

  @override
  void initState(BuildContext context) {}



  
}