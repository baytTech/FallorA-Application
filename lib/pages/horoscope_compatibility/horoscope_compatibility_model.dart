import '../../backend/model/gender/gender_selectable.dart';
import '../../backend/model/horoscope/horoscope_selectable.dart';
import '../horoscope_selection/seletable_items_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HoroscopeCompatibilityModel extends FlutterFlowModel {
  /// Initialization and disposal methods.

  final horoscopesController =
      SelectableItemController(HoroscopeSelectableItem.generate());
  final dualController = DualSelectableItemController(
      GenderSelectableItem.generate(), HoroscopeSelectableItem.generate());

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.
}
