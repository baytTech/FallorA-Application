import 'package:fallora/backend/model/birthdate/birth_date_request.dart';
import 'package:fallora/backend/repo/functions_repo.dart';
import 'package:fallora/backend/util/horoscope_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class DatePickerViewModel extends FlutterFlowModel {

  FunctionsRepo functionsRepo;
  DatePickerViewModel({required this.functionsRepo});


  void initState(BuildContext context) {
  }


  Future<void> dialogCallback({required BuildContext context,required int timeMillis}) async {
    var request = BirthDateRequest(birthDate: timeMillis);
    safeCall(
      apiCall: () => functionsRepo.updateBirthDate(request),
      callBack:(response) {
        Navigator.of(context).pop(HoroscopeUtil.horoscopeFromTimeMillis(timeMillis));
      },
    );
  }


  void dispose() {}
}
