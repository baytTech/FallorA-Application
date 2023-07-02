import 'package:fallora/widgets/back_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class InboxPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for BackButton component.
  late BackButtonModel backButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
  }

  void dispose() {
    backButtonModel.dispose();
  }

  /// Additional helper methods are added here.

}
