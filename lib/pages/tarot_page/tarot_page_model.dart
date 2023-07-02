import 'package:fallora/backend/repo/functions_repo.dart';
import 'package:fallora/pages/tarot_page/tarot_cubit.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class TarotPageModel extends FlutterFlowModel {
  final FunctionsRepo functionsRepo;
  final TarotCubit tarotCubit = TarotCubit();
  TarotPageModel({required this.functionsRepo});  
  
  void initState(BuildContext context) {}

  void dispose() {}

}
