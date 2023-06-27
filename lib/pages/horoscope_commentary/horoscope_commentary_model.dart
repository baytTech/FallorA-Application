import 'package:fallora/backend/model/gender/gender.dart';
import 'package:fallora/backend/model/horoscope/horoscope.dart';
import 'package:fallora/backend/repo/functions_repo.dart';
import 'package:fallora/backend/util/base_response.dart';
import 'package:fallora/backend/util/date_util.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class HoroscopeCommentaryModel extends FlutterFlowModel {
  FunctionsRepo repo;
  HoroscopeCommentaryModel(this.repo);

  DateTime date = DateTime.now();

  String get day => date.day.toString();
  String get month => DateUtil.getMonth(date.month);      


  String comment = "";

  void initState(BuildContext context) {}

  void getData(Horoscope sign,Function? updateState) {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    repo.getHoroscopeReadings(Gender.Female.code, sign.code).then((value) {
        if(value.status == Status.SUCCESS) {   
          comment = value.data?.data ?? "";
        }  
        updateState?.call();
        EasyLoading.dismiss();
    });
  }

  void dispose() {}
}
