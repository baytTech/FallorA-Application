import 'package:fallora/widgets/appbar/FalloraAppBar.dart';
import 'package:fallora/widgets/menulabel/MenuLabel.dart';
import 'package:fallora/injection.dart';
import 'package:fallora/res/color.res.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'horoscope_commentary_model.dart';
export 'horoscope_commentary_model.dart';

class HoroscopeCommentaryWidget extends StatefulWidget {
  const HoroscopeCommentaryWidget({Key? key}) : super(key: key);

  @override
  _HoroscopeCommentaryWidgetState createState() =>
      _HoroscopeCommentaryWidgetState();
}

class _HoroscopeCommentaryWidgetState extends State<HoroscopeCommentaryWidget> {
  late HoroscopeCommentaryModel viewModel;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    viewModel = createModel(context, () => HoroscopeCommentaryModel(getIt.get()));
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: FalloraAppBar(context: context),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4E4E4E), Color(0xFF181818), Color(0xFF4E4E4E)],
              stops: [0.0, 0.5, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: Image.asset(
                      'assets/images/horoscope.png',
                    ).image,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      MenuLabel(text: "BURÇ YORUM")
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.all(20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: MediaQuery.of(context).size.height * 0.13,
                              decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                  image: AssetImage('assets/images/gemini_sign_2.png')
                                ),
                                boxShadow: [
                                 BoxShadow(
                                  blurRadius: 5.0,
                                    color: Color(0x9D000000),
                                    offset: Offset(0.0, 3.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Align(
                              alignment: AlignmentDirectional(0.9, 0.0),
                                child: Text( 'İkizler',
                                  style: GoogleFonts.playfairDisplay(
                                    color: AppColors.white,
                                    fontSize: 24
                                  )
                                ),
                              ),
                            ),
                            Expanded(
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
                                    colors: [
                                      Color(0xFF3C3C3C),
                                      Colors.black
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(0.0, -1.0),
                                    end: AlignmentDirectional(0, 1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                  child: Column(
                                    mainAxisSize:MainAxisSize.max,
                                    mainAxisAlignment:MainAxisAlignment.center,
                                    children: [
                                      AutoSizeText(
                                        viewModel.day,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.playfairDisplay(
                                          fontSize: 36,
                                          color: AppColors.white,
                                        )
                                      ),
                                      AutoSizeText(
                                        viewModel.month,
                                        style: GoogleFonts.playfairDisplay(
                                        fontSize: 13,
                                        color: AppColors.white
                                      )
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *0.11,
                                    height: MediaQuery.of(context).size.height *0.05,
                                    decoration: BoxDecoration(),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: '',
                                      icon: Icon(
                                        Icons.share_rounded,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 50.0,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.zero,
                                        iconPadding: EdgeInsetsDirectional.zero,
                                        color: Color(0xFF212121),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *0.11,
                                    height: MediaQuery.of(context).size.height *0.05,
                                    decoration: BoxDecoration(),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: 'Aa',
                                      options: FFButtonOptions(
                                        width: 50.0,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.zero,
                                        iconPadding: EdgeInsetsDirectional.zero,
                                        color: Color(0xFF212121),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Playfair Display',
                                              color: Colors.white,
                                              fontSize: 24.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0x2EFFFFFF),
                                  borderRadius: BorderRadius.circular(30.0),
                                  border: Border.all(color: Colors.white12),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:MainAxisAlignment.start,
                                      children: [
                                        Padding(padding:EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                                          child: Text(
                                            viewModel.comment,
                                            style: GoogleFonts.poppins(
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w300,
                                              letterSpacing: 0.5
                                            )
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(bottom: 50.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {context.safePop();},
                            child: Material(
                              color: Colors.transparent,
                              elevation: 10.0,
                              shape: const CircleBorder(),
                              child: Container(
                                width: 75.0,
                                height: 75.0,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).primary,
                                      FlutterFlowTheme.of(context).secondary
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(0.0, -1.0),
                                    end: AlignmentDirectional(0, 1.0),
                                  ),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 3.0,
                                  ),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.safePop();
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios_outlined,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
