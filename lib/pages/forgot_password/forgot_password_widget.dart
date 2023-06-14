import 'dart:io';
import 'dart:ui';

import 'package:fallora/widgets/fallora_button.dart';
import 'package:fallora/widgets/text_form_field.dart';
import 'package:fallora/widgets/back_button_widget.dart';
import 'package:fallora/res/color.res.dart';
import 'package:flutter/services.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'forgot_password_model.dart';
export 'forgot_password_model.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({Key? key}) : super(key: key);

  @override
  _ForgotPasswordWidgetState createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  late ForgotPasswordModel viewModel;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    viewModel = createModel(context, () => ForgotPasswordModel());
  }

  @override
  void dispose() {
    viewModel.dispose();
    _unfocusNode.dispose();
    super.dispose();
  }

  var borderRadius = BorderRadius.only(
    bottomLeft: Radius.circular(50.0),
    bottomRight: Radius.circular(50.0),
    topLeft: Radius.circular(0.0),
    topRight: Radius.circular(0.0),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: WillPopScope(
        onWillPop: () async {
          context.safePop();
          return false;
        },
        child: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0x990F1113),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        'assets/images/a_mystical_woman_with_horns_drinks_turkish_coffee_2.png'),
                  ),
                )),
            Scaffold(
              backgroundColor: Color(0x0014181B),
              appBar: PreferredSize(
                preferredSize:
                    Size.fromHeight(MediaQuery.of(context).size.height * 0.12),
                child: ForgotPasswordAppBar(),
              ),
              body: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(color: Color(0x0014181B)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 25),
                      ClipRRect(
                        borderRadius: borderRadius,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(0.5),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.white70, Colors.white30]),
                              borderRadius: borderRadius,
                              border:
                                  Border.all(width: 2, color: Colors.white30),
                            ),
                            child: DefaultTabController(
                              length: 1,
                              initialIndex: 0,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment(0.0, 0),
                                    child: TabBar(
                                      isScrollable: true,
                                      labelColor: Colors.white,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF0F1113),
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                      indicatorColor: AppColors.secondaryColor,
                                      indicatorWeight: 5.0,
                                      tabs: [Tab(text: 'Şifremi unuttum')],
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          decoration: BoxDecoration(
                                              color: Color(0x3BFFFFFF)),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 0.0, 30.0, 0.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  SizedBox(height: 20),
                                                  Text(
                                                    'Şifrenizi sıfırlamanız için bağlantı içeren bir e-posta göndereceğiz, lütfen hesabınıza bağlı olan e-postayı aşağıya girin.',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 12),
                                                  ),
                                                  SizedBox(height: 20),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 14.0),
                                                    child: CustomTextFormField(
                                                      hintText: "E-posta",
                                                      controller: viewModel
                                                          .emailController,
                                                      type: TextFormFieldType
                                                          .EMAIL,
                                                      key: viewModel
                                                          .emailFormField,
                                                      validator: viewModel
                                                          .emailValidator,
                                                      showEmptyButton: true,
                                                    ),
                                                  ),
                                                  SizedBox(height: 24),
                                                  FalloraButton(
                                                    onPressed: () => viewModel
                                                        .submit(context),
                                                    title: 'Gönder',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      backButtonifiOS()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget backButtonifiOS() {
    if (Platform.isIOS) {
      return BackButtonWidget();
    } else {
      return SizedBox();
    }
  }
}

class ForgotPasswordAppBar extends StatelessWidget {
  const ForgotPasswordAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Color(0x00FFFFFF),
      automaticallyImplyLeading: false,
      actions: [],
      flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60.0),
            bottomRight: Radius.circular(60.0),
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF40113B), Color(0xFF730195)],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Visibility(
              visible: responsiveVisibility(context: context, desktop: false),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          100.0, 50.0, 100.0, 5.0),
                      child: Image.asset(
                        'assets/images/Fallora_narrow.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Container(),
      ),
      centerTitle: false,
      elevation: 0.0,
    );
  }
}
