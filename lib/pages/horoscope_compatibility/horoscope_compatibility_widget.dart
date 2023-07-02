import 'package:fallora/backend/model/gender/gender.dart';
import 'package:fallora/backend/model/horoscope/horoscope.dart';
import 'package:fallora/domain/model/record/dart_record.dart';
import 'package:fallora/injection.dart';
import 'package:fallora/res/color.res.dart';
import 'package:fallora/res/image.res.dart';
import 'package:fallora/widgets/appbar/FalloraAppBar.dart';
import 'package:fallora/widgets/menulabel/MenuLabel.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'horoscope_compatibility_model.dart';
export 'horoscope_compatibility_model.dart';

class HoroscopeCompatibilityWidget extends StatefulWidget {
  final DartRecord<Gender,Horoscope> param1;
  final DartRecord<Gender,Horoscope> param2;

  const HoroscopeCompatibilityWidget({
    Key? key, 
    required this.param1, 
    required this.param2
  }) : super(key: key);

  @override
  _HoroscopeCompatibilityWidgetState createState() =>
      _HoroscopeCompatibilityWidgetState();
}

class _HoroscopeCompatibilityWidgetState extends State<HoroscopeCompatibilityWidget> {
  late HoroscopeCompatibilityModel viewModel;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    viewModel = createModel(context, () => HoroscopeCompatibilityModel(repo: getIt()));
    viewModel.param1 = widget.param1;
    viewModel.param2 = widget.param2;
    viewModel.getData((){
      setState(() {});
    });
  }

  @override
  void dispose() {
    viewModel.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: FalloraAppBar(
          context: context,
          isHome: false,
          gradient: AppColors.appBarGradiet
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/Couple_compatibility.png',),
                  ),
                ),
                child: MenuLabel(
                  text: "BURÇ UYUM",
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20),
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: double.infinity,
                  decoration: BoxDecoration(gradient: AppColors.pageGradient),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                      Padding(
                        padding: EdgeInsetsDirectional.all(20),
                        child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _HoroscopeSelectionWidget(
                              gender: viewModel.param1?.param1,
                              horoscope: viewModel.param1?.param2,
                            ),
                             _HoroscopeSelectionWidget(
                              gender: viewModel.param2?.param1,
                              horoscope: viewModel.param2?.param2,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *0.11,
                                    height:MediaQuery.of(context).size.height *0.05,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 5.0,
                                          color: Color(0x7F000000),
                                          offset: Offset(0.0, 3.0),
                                        )
                                      ],
                                    ),
                                    child: FFButtonWidget(
                                      onPressed: () {},
                                      text: '',
                                      icon: Icon(
                                        Icons.share_rounded,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 50.0,
                                        height: 50.0,
                                        padding:EdgeInsetsDirectional.zero,
                                        iconPadding:EdgeInsetsDirectional.zero,
                                        color: Color(0xFF212121),
                                        textStyle: GoogleFonts.playfairDisplay(
                                          color: Colors.white,
                                          fontSize: 50.0,
                                        ),
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
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.11,
                                      height: MediaQuery.of(context).size.height * 0.05,
                                      decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 5.0,
                                          color: Color(0x80000000),
                                          offset: Offset(0.0, 3.0),
                                        )
                                      ],
                                    ),
                                    child: FFButtonWidget(
                                      onPressed: () {},
                                      text: 'Aa',
                                      options: FFButtonOptions(
                                        width: 50.0,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.zero,
                                        iconPadding: EdgeInsetsDirectional.zero,
                                        color: Color(0xFF212121),
                                        textStyle: GoogleFonts.playfairDisplay(
                                         color: Colors.white,
                                          fontSize: 24.0,
                                        ),
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
                                ],
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.all(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Container(
                            width: double.infinity,
                            height: 380,
                            padding: EdgeInsetsDirectional.all(20),
                            decoration: BoxDecoration(
                              color: Color(0x2EFFFFFF),
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(color: Colors.white12),
                            ),
                            child: SingleChildScrollView(
                              child: AnimatedOpacity(
                                duration: 1200.milliseconds,
                                opacity: (viewModel.relevance?.content ?? "").isEmpty ? 0 : 1,
                                child: Column(
                                  children: [
                                    Text(
                                      viewModel.relevance?.title ?? "",
                                      style: GoogleFonts.poppins(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        letterSpacing: 0.2
                                      )
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      viewModel.relevance?.content ?? "",
                                      style: GoogleFonts.poppins(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 0.5
                                      )
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
      ),
    );
  }
}

class CompatibilityIndicator extends StatelessWidget {
  final double percentage;

  const CompatibilityIndicator({
    required this.percentage,
  });

  double calculatePixelWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.4 * (percentage / 100);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.075,
      decoration: BoxDecoration(
        color: const Color(0xFF4D4D4D),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x7A000000),
            offset: Offset(0.0, 3.0),
          ),
        ],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            curve: Curves.linear,
            width: calculatePixelWidth(context),
            height: double.infinity,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5.0,
                  color: Color(0x81000000),
                  offset: Offset(3.0, 0.0),
                ),
              ],
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF8B0000),
                  Color(0xFF240000),
                ],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Align(
              alignment: const AlignmentDirectional(1.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  '%${percentage.toStringAsFixed(0)}',
                  style: const TextStyle(fontSize: 30.0),
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
  final Horoscope? horoscope;
  final Gender? gender;
  const _HoroscopeSelectionWidget({
    this.horoscope, 
    this.gender
  });

  @override
  Widget build(BuildContext context) {  
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AppImages.horosopeBackgroundAsset,
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            horoscope?.imagePath??"",
            width: MediaQuery.of(context).size.width * 0.16,
          ),
          Text(
            "${horoscope?.description} ${gender?.description}",
            style: GoogleFonts.playfairDisplay(
              color: Colors.white,
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}