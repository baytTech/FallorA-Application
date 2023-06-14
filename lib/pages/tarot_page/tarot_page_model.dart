import 'package:fallora/backend/model/tarot/tarot.dart';
import 'package:fallora/backend/repo/functions_repo.dart';
import 'package:fallora/backend/util/base_response.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class TarotPageModel extends FlutterFlowModel {
  final FunctionsRepo functionsRepo;
  TarotPageModel({required this.functionsRepo});
  
  List<Tarot> tarotCards = <Tarot>[];
  
  void initState(BuildContext context) {
    return;
    safeCall(
      apiCall: () => functionsRepo.suffleTarrots(),
      callBack:(BaseResponse<List<Tarot>> response) {
        switch (response.status) {
          case Status.ERROR:
          break;
          default:
          tarotCards.addAll(response.data??[]);
        }
      },
    );
  }

  void dispose() {}

}
