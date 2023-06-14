import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';


abstract class DialogBuilder {
 static AwesomeDialog errorDialogBuilder(BuildContext context, String? desc) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      btnOkText: "Tamam",
      title: desc,
      showCloseIcon: true,
      btnOkColor: Colors.red.shade400,
      btnOkOnPress: () {},
    );
  }

  static AwesomeDialog successDialogBuilder(BuildContext context, String? title, String? desc) {
    return AwesomeDialog(
      context: context,
      padding: EdgeInsets.only(bottom: 20),
      dialogType: DialogType.success,
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      autoHide: Duration(milliseconds: 3000),
      title: title,
      desc: desc,
      btnOkColor: Colors.green,
    );
  }
}