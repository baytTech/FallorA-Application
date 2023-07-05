import 'package:fallora/backend/model/horoscope/horoscope_selectable.dart';
import 'package:fallora/res/color.res.dart';
import 'package:fallora/res/string.res.dart';
import 'package:fallora/widgets/appbar/FalloraAppBar.dart';
import 'package:fallora/widgets/bottomsheet/horoscope_selection_bottom_sheet.dart';
import 'package:fallora/widgets/dropdown/fallora_drop_down_widget.dart';
import 'package:fallora/widgets/fallora_button.dart';
import 'package:fallora/widgets/menulabel/MenuLabel.dart';
import 'package:fallora/widgets/text_form_field.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'send_coffee_cup_model.dart';
export 'send_coffee_cup_model.dart';

class SendCoffeeCupWidget extends StatefulWidget {
  const SendCoffeeCupWidget({Key? key}) : super(key: key);

  @override
  _SendCoffeeCupWidgetState createState() => _SendCoffeeCupWidgetState();
}

class _SendCoffeeCupWidgetState extends State<SendCoffeeCupWidget> {
  late SendCoffeeCupModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = createModel(context, () => SendCoffeeCupModel());
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  Future<HoroscopeSelectableItem?> selectHoroscopeBottomSheet() {
    return horoscopeSelectionBottomSheetBuilder(
        context: context, controller: viewModel.horoscopesController);
  }

  TextStyle get hintStyle => GoogleFonts.poppins(
      color: Color(0xFF95A1AC), fontSize: 14.0, fontWeight: FontWeight.normal);

  var textStyle = GoogleFonts.poppins(
      color: Color(0xFF0F1113), fontSize: 16.0, fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: FalloraAppBar(
        context: context,
        isHome: false,
        gradient: AppColors.appBarGradiet,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.pageGradient),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/coffee_2.png'),
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                  shape: BoxShape.rectangle,
                ),
                child: MenuLabel(
                    text: "KAHVE FALI",
                    alignment: Alignment.centerLeft,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 5.0))),
            Expanded(
              child: Container(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(vertical: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  maxWidth: 500.00,
                                  maxHeight: 500.00,
                                  imageQuality: 50,
                                  allowPhoto: true,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(
                                      () => viewModel.isDataUploading1 = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];
                                  try {
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();
                                  } finally {
                                    viewModel.isDataUploading1 = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                      selectedMedia.length) {
                                    setState(() {
                                      viewModel.uploadedLocalFile1 =
                                          selectedUploadedFiles.first;
                                    });
                                  } else {
                                    setState(() {});
                                    return;
                                  }
                                }
                              },
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      offset: Offset(0.0, 0.0),
                                      spreadRadius: 2.0,
                                    )
                                  ],
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 60.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  maxWidth: 500.00,
                                  maxHeight: 500.00,
                                  imageQuality: 50,
                                  allowPhoto: true,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(
                                      () => viewModel.isDataUploading2 = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];
                                  try {
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();
                                  } finally {
                                    viewModel.isDataUploading2 = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                      selectedMedia.length) {
                                    setState(() {
                                      viewModel.uploadedLocalFile2 =
                                          selectedUploadedFiles.first;
                                    });
                                  } else {
                                    setState(() {});
                                    return;
                                  }
                                }
                              },
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      offset: Offset(0.0, 0.0),
                                      spreadRadius: 2.0,
                                    )
                                  ],
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 60.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  maxWidth: 500.00,
                                  maxHeight: 500.00,
                                  imageQuality: 50,
                                  allowPhoto: true,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(
                                      () => viewModel.isDataUploading3 = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];
                                  try {
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();
                                  } finally {
                                    viewModel.isDataUploading3 = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                      selectedMedia.length) {
                                    setState(() {
                                      viewModel.uploadedLocalFile3 =
                                          selectedUploadedFiles.first;
                                    });
                                  } else {
                                    setState(() {});
                                    return;
                                  }
                                }
                              },
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      offset: Offset(0.0, 0.0),
                                      spreadRadius: 2.0,
                                    )
                                  ],
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 60.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsetsDirectional.all(10.0),
                              child: CustomTextFormField(
                                  controller: viewModel.nameController,
                                  hintText: "Adı")),
                          Padding(
                            padding: EdgeInsetsDirectional.all(10.0),
                            child: FalloraDropDownWidget<String>(
                              controller: viewModel.relationFormField,
                              options: AppStrings.relationStatus,
                              onChanged: (val) => setState(
                                  () => viewModel.dropDownValue1 = val),
                              width: double.infinity,
                              textStyle: textStyle,
                              hintText: 'İlişki durumu',
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 4.0, 12.0, 4.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.all(10),
                            child: InkWell(
                              onTap: selectHoroscopeBottomSheet,
                              child: Container(
                                height: 60,
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Burç', style: hintStyle),
                                    Text('(seçmek için tıklayınız)',
                                        style:
                                            hintStyle.copyWith(fontSize: 12)),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.all(10.0),
                            child: FalloraDropDownWidget<String>(
                              controller: viewModel.categoryFormField,
                              options: AppStrings.fortuneCategories,
                              onChanged: (val) => setState(
                                  () => viewModel.dropDownValue2 = val),
                              height: 60,
                              textStyle: textStyle,
                              hintText: 'Kategori',
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 4.0, 12.0, 4.0),
                            ),
                          ),
                          FalloraButton(title: "Gönder")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 49,
                      child: FlutterFlowAdBanner(
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: 50.0,
                        showsTestAd: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
