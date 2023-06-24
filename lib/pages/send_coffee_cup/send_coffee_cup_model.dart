import 'package:fallora/backend/model/horoscope/horoscope_selectable.dart';
import 'package:fallora/pages/horoscope_selection/seletable_items_controller.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';

class SendCoffeeCupModel extends FlutterFlowModel {

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 = FFUploadedFile(bytes: Uint8List.fromList([]));
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 = FFUploadedFile(bytes: Uint8List.fromList([]));
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =  FFUploadedFile(bytes: Uint8List.fromList([]));



  final horoscopesController = SelectableItemController(HoroscopeSelectableItem.generate());
  TextEditingController nameController = TextEditingController();
  String? dropDownValue1;
  FormFieldController<String> relationFormField = FormFieldController<String>(null);
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String> categoryFormField = FormFieldController<String>(null);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    nameController.dispose();
  }


}
