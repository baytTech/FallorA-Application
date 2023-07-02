import 'package:fallora/backend/model/horoscope/horoscope.dart';
import 'package:fallora/res/image.res.dart';
import 'package:fallora/widgets/appbar/FalloraAppBar.dart';
import 'package:fallora/widgets/menulabel/MenuLabel.dart';
import 'package:fallora/injection.dart';
import 'package:fallora/res/color.res.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'horoscope_commentary_model.dart';
export 'horoscope_commentary_model.dart';

class HoroscopeCommentaryWidget extends StatefulWidget {
  final Horoscope sign;
  const HoroscopeCommentaryWidget({Key? key, required this.sign}) : super(key: key);

  @override
  _HoroscopeCommentaryWidgetState createState() =>
      _HoroscopeCommentaryWidgetState();
}

class _HoroscopeCommentaryWidgetState extends State<HoroscopeCommentaryWidget> {
  late HoroscopeCommentaryModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = createModel(context, () => HoroscopeCommentaryModel(getIt.get()));
    viewModel.getData(widget.sign,(){
      setState(() {
        
      });
    });
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FalloraAppBar(
        context: context, 
        isHome: false, 
        gradient: AppColors.appBarGradiet
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: AppColors.pageGradient
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                color: Color(0x00FFFFFF),
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage('assets/images/horoscope.png',),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 5.0),
                child: MenuLabel(text: "BURÇ YORUM",alignment: Alignment.bottomRight,)
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
                            width: MediaQuery.of(context).size.width * 0.56,
                            constraints: BoxConstraints(
                              minHeight:  MediaQuery.of(context).size.height * 0.12,
                              maxHeight:  MediaQuery.of(context).size.height * 0.16
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AppImages.horosopeBackgroundAsset,
                                fit: BoxFit.cover,
                              )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  widget.sign.imagePath,
                                  width: 70,
                                ),
                                Text(
                                  widget.sign.description,
                                  style: GoogleFonts.playfairDisplay(
                                    color: Colors.white,
                                    fontSize: 23.0,
                                  )
                                ),
                              ]
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.only(start:8),
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
                              onPressed: () {print('Button pressed ...'); },
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
                                    .titleSmall.override(
                                      fontFamily: 'Playfair Display',
                                            color: Colors.white,
                                            fontSize: 24.0,
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
                      Padding(
                        padding: EdgeInsetsDirectional.all(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Container(
                            width: double.infinity,
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
                                    Padding(padding:EdgeInsetsDirectional.fromSTEB(20.0, 25.0, 20.0, 20.0),
                                      child: AnimatedOpacity(
                                        duration: 1200.milliseconds,
                                        opacity: viewModel.comment.isEmpty ? 0 : 1,
                                        child: Text(
                                          viewModel.comment,
                                          style: GoogleFonts.poppins(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 0.5
                                          )
                                        ),
                                      ),
                                    ),
                                  ],
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
    );
  }
}
