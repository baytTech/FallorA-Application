import 'package:fallora/backend/model/gender/gender.dart';
import 'package:fallora/backend/model/horoscope/horoscope.dart';
import 'package:fallora/backend/model/horoscope_relevance/horoscope_relevance.dart';
import 'package:fallora/backend/model/horoscope_request/relevance_request.dart';
import 'package:fallora/backend/repo/functions_repo.dart';
import 'package:fallora/backend/util/base_response.dart';
import 'package:fallora/domain/model/record/dart_record.dart';
import 'package:fallora/injection.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class HoroscopeCompatibilityModel extends FlutterFlowModel {

  final FunctionsRepo repo;

  DartRecord<Gender,Horoscope>? param1;
  DartRecord<Gender,Horoscope>? param2;

  HoroscopeRelevance? relevance = null;

  HoroscopeCompatibilityModel({required this.repo});

  void initState(BuildContext context) {}

   void getData(Function? updateState) {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    var body = HoroscopeRelevanceRequest(
      sign1: (param1?.param2 as Horoscope).code,
      sign2: (param2?.param2 as Horoscope).code, 
      gender1: (param1?.param1 as Gender).code,
      gender2: (param2?.param1 as Gender).code,
    );
    logger.i(body);
    repo.horoscopeRelevance(body).then((value) {
        if(value.status == Status.SUCCESS) {   
          relevance = value.data;
        }  
        updateState?.call();
        EasyLoading.dismiss();
    });
  }

  void dispose() {}

}
