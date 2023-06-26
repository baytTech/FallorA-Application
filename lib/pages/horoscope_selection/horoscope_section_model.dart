import 'package:fallora/backend/auth/auth.manager.dart';
import 'package:fallora/backend/model/gender/gender_selectable.dart';
import 'package:fallora/backend/model/horoscope/horoscope.dart';
import 'package:fallora/backend/model/horoscope/horoscope_selectable.dart';
import 'package:fallora/backend/repo/functions_repo.dart';
import 'package:fallora/backend/util/horoscope_util.dart';
import 'package:fallora/pages/date_picker/date_picker_dialog.dart';
import 'package:fallora/pages/horoscope_selection/cubit/comment.cubit.dart';
import 'package:fallora/pages/horoscope_selection/seletable_items_controller.dart';
import 'package:flutter/scheduler.dart';
import '../../backend/util/date_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class HoroscopeSectionModel extends FlutterFlowModel {
  DateTime date = DateTime.now();
  String get day => date.day.toString();
  String get month => DateUtil.getMonth(date.month);
  FunctionsRepo functionsRepo;
  AuthManager authManager;

  HoroscopeSectionModel(
      {required this.functionsRepo, required this.authManager});

  final horoscopesController =
      SelectableItemController(HoroscopeSelectableItem.generate());
  final dualController = DualSelectableItemController(
      GenderSelectableItem.generate(), HoroscopeSelectableItem.generate());
  final commentCubit = HoroscopeCommentCubit();
  final compatibilityCubit = HoroscopeCommentCubit();

  void initState(BuildContext context) {
    var user = authManager.userCubic.state;
    if (user?.birthDate == null) {
      SchedulerBinding.instance.addPostFrameCallback((_) =>
          showDialog<Horoscope>(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) {
                    return BirthDatePickerDialog();
                  })
              .then((value) => commentCubit.setState(HoroscopeSelectableItem(
                  horoscope: value!, isSelected: true))));
    } else {
      var horoscope =
          HoroscopeUtil.horoscopeFromTimeMillis(user?.birthDate ?? 0);
      commentCubit.setState(
          HoroscopeSelectableItem(horoscope: horoscope, isSelected: true));
    }
  }

  void dispose() {}
}
