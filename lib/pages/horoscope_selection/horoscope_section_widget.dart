import 'package:fallora/backend/model/gender/gender.dart';
import 'package:fallora/backend/model/gender/gender_selectable.dart';
import 'package:fallora/backend/model/horoscope/horoscope_selectable.dart';
import 'package:fallora/backend/util/dart_record.dart';
import 'package:fallora/injection.dart';
import 'package:fallora/pages/horoscope_selection/cubit/comment.cubit.dart';
import 'package:fallora/widgets/appbar/FalloraAppBar.dart';
import 'package:fallora/widgets/back_button_widget.dart';
import 'package:fallora/widgets/bottomsheet/horoscope_selection_bottom_sheet.dart';
import 'package:fallora/widgets/bottomsheet/horoscope_selection_extended_bottom_sheet.dart';
import 'package:fallora/widgets/menulabel/MenuLabel.dart';
import 'package:fallora/res/color.res.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'horoscope_section_model.dart';
export 'horoscope_section_model.dart';

class HoroscopeSectionWidget extends StatefulWidget {
  const HoroscopeSectionWidget({Key? key}) : super(key: key);

  @override
  _HoroscopeSectionWidgetState createState() => _HoroscopeSectionWidgetState();
}

class _HoroscopeSectionWidgetState extends State<HoroscopeSectionWidget> {
  late HoroscopeSectionModel viewModel;
  bool isSelectedHoroscope = false;
  bool isSelectedGender = false;

  void selectHoroscope() {
    setState(() {
      isSelectedHoroscope = true;
    });
  }

  void selectGender() {
    setState(() {
      isSelectedGender = true;
    });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    viewModel = createModel(
        context,
        () => HoroscopeSectionModel(
            functionsRepo: getIt(), authManager: getIt()));
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  Future<HoroscopeSelectableItem?> selectHoroscopeBottomSheet() {
    return horoscopeSelectionBottomSheetBuilder(
            context: context, controller: viewModel.horoscopesController)
        .then((value) {
      selectHoroscope();
      var selectedHoroscope = value?.horoscope;
      return viewModel.commentCubit.setState(value);
    });
  }

  Future<DartRecord<GenderSelectableItem, HoroscopeSelectableItem>?>
      selectHoroscopeAndGenderBottomSheet() {
    return horoscopeSelectionExtendedBottomSheetBuilder(
      context: context,
      controller: viewModel.dualController,
    ).then((value) {
      selectGender();
      return value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: FalloraAppBar(
        context: context,
        isHome: false,
        gradient:
            LinearGradient(colors: [Color(0xFF31113B), Color(0xFF258195)]),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 30),
              width: MediaQuery.of(context).size.width,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xFF4E4E4E),
                      Color(0xFF181818),
                      Color(0xFF4E4E4E)
                    ],
                    stops: [
                      0.0,
                      0.5,
                      1.0
                    ],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacer(flex: 2),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Color(0x00FFFFFF),
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage('assets/images/horoscope.png'),
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MenuLabel(
                                text: "BURÇ YORUM",
                                padding: EdgeInsetsDirectional.only(
                                    end: 10, bottom: 5),
                              )
                            ],
                          ),
                        ),
                      ),
                      BlocBuilder<HoroscopeCommentCubit,
                              HoroscopeSelectableItem?>(
                          bloc: viewModel.commentCubit,
                          builder: (context, state) {
                            return Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.25,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF7C7C7C),
                                    Color(0xFF272727),
                                    Color(0xFF7C7C7C)
                                  ],
                                  stops: [0.0, 0.5, 1.0],
                                  begin: AlignmentDirectional(0.0, -1.0),
                                  end: AlignmentDirectional(0, 1.0),
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                                border: Border.all(color: Colors.white12),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.symmetric(
                                        vertical: 20, horizontal: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        InkWell(
                                          onTap: () =>
                                              selectHoroscopeBottomSheet(),
                                          child: Container(
                                            padding: EdgeInsets.only(right: 14),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.56,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.12,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.scaleDown,
                                                  alignment:
                                                      Alignment(-0.6, .0),
                                                  image: AssetImage(
                                                      state != null
                                                          ? state.horoscope
                                                              .imagePath
                                                          : "")),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 5.0,
                                                  color: Color.fromARGB(
                                                      157, 31, 30, 30),
                                                  offset: Offset(0.0, 3.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.9, 0.0),
                                              child: Text(
                                                  state != null
                                                      ? state
                                                          .horoscope.description
                                                      : "",
                                                  style: GoogleFonts
                                                      .playfairDisplay(
                                                    color: Colors.white,
                                                    fontSize: 24.0,
                                                  )),
                                            ),
                                          ),
                                        ),
                                        //_Expanded(viewModel: viewModel),  //SILINECEK
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 5.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Container(
                                        width: 130.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                              FlutterFlowTheme.of(context)
                                                  .secondary
                                            ],
                                            stops: [0.0, 1.0],
                                            begin:
                                                AlignmentDirectional(0.0, -1.0),
                                            end: AlignmentDirectional(0, 1.0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 5.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed(
                                                  'HoroscopeCommentary');
                                            },
                                            text: 'Devamını Oku',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: double.infinity,
                                              padding:
                                                  EdgeInsetsDirectional.zero,
                                              iconPadding:
                                                  EdgeInsetsDirectional.zero,
                                              color: Color(0x00730195),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .copyWith(
                                                          color:
                                                              AppColors.white),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ],
                  ),
                  Spacer(flex: 2),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Color(0x00FFFFFF),
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage(
                                'assets/images/Couple_compatibility.png'),
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(start: 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              MenuLabel(
                                text: "BURÇ UYUM",
                                padding: EdgeInsetsDirectional.only(
                                    start: 10, bottom: 5),
                              ),
                            ],
                          ),
                        ),
                      ),
                      _HoroscopeCompatibilityContainer(context),
                    ],
                  ),
                  Spacer(flex: 2),
                  BackButtonWidget(),
                  Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _HoroscopeCompatibilityContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF7C7C7C), Color(0xFF272727), Color(0xFF7C7C7C)],
          stops: [0.0, 0.5, 1.0],
          begin: AlignmentDirectional(0.0, -1.0),
          end: AlignmentDirectional(0, 1.0),
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.all(15.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Expanded(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          selectHoroscopeAndGenderBottomSheet();
                        },
                        child: _HoroscopeSelectionWidget(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Expanded(
                      child: _HoroscopeContainer(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                width: 130.0,
                height: 40.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).primary,
                      FlutterFlowTheme.of(context).secondary
                    ],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(vertical: 5),
                  child: FFButtonWidget(
                    onPressed: () async {
                      isSelectedGender = true;
                      if (isSelectedGender) {
                        context.pushNamed('HoroscopeCompatibility');
                      }
                    },
                    text: 'Devamını oku ',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: double.infinity,
                      padding: EdgeInsetsDirectional.zero,
                      iconPadding: EdgeInsetsDirectional.zero,
                      color: Color(0x00730195),
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .copyWith(
                              color: isSelectedGender ? AppColors.white : null),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HoroscopeSelectionWidget extends StatelessWidget {
  const _HoroscopeSelectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x61000000),
            offset: Offset(0.0, 3.0),
          )
        ],
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 74, 73, 73),
            Color.fromARGB(255, 30, 29, 29)
          ],
          stops: [0.0, 1.0],
          begin: AlignmentDirectional(0.0, -1.0),
          end: AlignmentDirectional(0, 1.0),
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        child: Column(
          children: [
            Transform.scale(
              scale: 0.7,
              child: Image.asset(
                'assets/images/question_mark.png',
              ),
            ),
            Expanded(
              child: Text(
                'Seciniz',
                style: GoogleFonts.playfairDisplay(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _HoroscopeContainer extends StatelessWidget {
  const _HoroscopeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x61000000),
            offset: Offset(0.0, 3.0),
          )
        ],
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 43, 42, 43),
            Color.fromARGB(255, 25, 25, 25)
          ],
          stops: [0.0, 1.0],
          begin: AlignmentDirectional(0.0, -1.0),
          end: AlignmentDirectional(0, 1.0),
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: _HoroscopeContainerColumn(),
    );
  }
}

class _HoroscopeContainerColumn extends StatelessWidget {
  const _HoroscopeContainerColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/horoscope/gemini_sign.png',
            width: 80.0,
            height: MediaQuery.of(context).size.height * 0.1,
            fit: BoxFit.fitHeight,
          ),
          Expanded(
            child: Text(
              'Basak Kadını',
              style: GoogleFonts.playfairDisplay(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Expanded extends StatelessWidget {
  const _Expanded({
    super.key,
    required this.viewModel,
  });

  final HoroscopeSectionModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.12,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                color: Color(0x74000000),
                offset: Offset(0.0, 3.0),
              )
            ],
            gradient: LinearGradient(
              colors: [Color(0xFF3C3C3C), Colors.black],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(viewModel.day,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 36,
                      color: AppColors.white,
                    )),
                AutoSizeText(viewModel.month,
                    style: GoogleFonts.playfairDisplay(
                        fontSize: 13, color: AppColors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
