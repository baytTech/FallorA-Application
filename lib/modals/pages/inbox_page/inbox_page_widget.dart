import 'package:fallora/widgets/back_button_widget.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'inbox_page_model.dart';
export 'inbox_page_model.dart';

class InboxPageWidget extends StatefulWidget {
  const InboxPageWidget({Key? key}) : super(key: key);

  @override
  _InboxPageWidgetState createState() => _InboxPageWidgetState();
}

class _InboxPageWidgetState extends State<InboxPageWidget> {
  late InboxPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InboxPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF9A9A9A),
        appBar: responsiveVisibility(
          context: context,
          desktop: false,
        )
            ? PreferredSize(
                preferredSize:
                    Size.fromHeight(MediaQuery.of(context).size.height * 0.09),
                child: AppBar(
                  backgroundColor: Color(0x00FFFFFF),
                  automaticallyImplyLeading: false,
                  actions: [],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      width: MediaQuery.of(context).size.width * 0.26,
                      height: MediaQuery.of(context).size.height * 0.11,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF40113B), Color(0xFF730195)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                      ),
                      child: Visibility(
                        visible: responsiveVisibility(
                          context: context,
                          desktop: false,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Color(0x00FFFFFF),
                                  size: 30.0,
                                ),
                                showLoadingIndicator: true,
                                onPressed: () async {
                                  context.safePop();
                                },
                              ),
                            ),
                            if (responsiveVisibility(
                              context: context,
                              desktop: false,
                            ))
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Image.asset(
                                    'assets/images/Fallora.png',
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.19,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                decoration: BoxDecoration(
                                  color: Color(0xFF2B022B),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: FaIcon(
                                        FontAwesomeIcons.solidStar,
                                        color: Color(0xFFFFBC00),
                                        size: 24.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3.0, 0.0, 0.0, 5.0),
                                      child: AutoSizeText(
                                        '9999',
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Playfair Display',
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
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
                  ),
                  centerTitle: false,
                  elevation: 0.0,
                ),
              )
            : null,
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFB8B8B8), Color(0xFF585858), Color(0xFFB8B8B8)],
              stops: [0.0, 0.5, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.0,
                              color: Color(0xFFE0E3E7),
                              offset: Offset(0.0, 1.0),
                            )
                          ],
                          gradient: LinearGradient(
                            colors: [Color(0xFFBEBEBE), Color(0xFF555555)],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(0.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 8.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 5.0, 5.0, 5.0),
                                child: FaIcon(
                                  FontAwesomeIcons.coffee,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'KF003938',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' Coffee Fortune Telling',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                        ),
                                      )
                                    ],
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Mar 8, 2022',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFFB8B8B8),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BackButtonWidget()
            ],
          ),
        ),
      ),
    );
  }
}
