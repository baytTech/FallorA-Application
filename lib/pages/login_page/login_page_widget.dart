import 'dart:ui';

import 'package:fallora/injection.dart';
import 'package:fallora/res/color.res.dart';
import 'package:fallora/widgets/fallora_button.dart';
import 'package:fallora/widgets/signinwith_apple_widget.dart';
import 'package:fallora/widgets/signinwith_google_widget.dart';
import 'package:fallora/widgets/text_form_field.dart';
import 'package:flutter/services.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_page_model.dart';
export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  late LoginPageModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = createModel(
        context,
        () => LoginPageModel(
            functionsRepo: getIt.get(),
            localRepo: getIt.get(),
            authManager: getIt.get()));
  }

  @override
  void dispose() {
    super.dispose();
  }

  BorderRadius borderRadius = BorderRadius.only(
    bottomLeft: Radius.circular(50.0),
    bottomRight: Radius.circular(50.0),
    topLeft: Radius.circular(0.0),
    topRight: Radius.circular(0.0),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(viewModel.unFocusNode),
      child: WillPopScope(
        onWillPop: () async {
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
                child: LoginPageAppBar(),
              ),
              body: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 1.0,
                height: MediaQuery.of(context).size.height * 1.0,
                decoration: BoxDecoration(color: Color(0x0014181B)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: borderRadius,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: MediaQuery.of(context).size.height * 0.6,
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
                              length: 2,
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
                                      tabs: [
                                        Tab(text: 'Giriş'),
                                        Tab(text: 'Kayıt ol'),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        Container(
                                          padding:
                                              EdgeInsetsDirectional.symmetric(
                                                  horizontal: 44),
                                          decoration: BoxDecoration(
                                              color: Color(0x3BFFFFFF),
                                              borderRadius: borderRadius),
                                          child: SingleChildScrollView(
                                            child: Form(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(height: 20),
                                                  CustomTextFormField(
                                                    key: viewModel
                                                        .emailLoginFormField,
                                                    hintText: "E-posta",
                                                    controller: viewModel
                                                        .emailLoginController,
                                                    type:
                                                        TextFormFieldType.EMAIL,
                                                    validator: viewModel
                                                        .emailValidator,
                                                    showEmptyButton: true,
                                                  ),
                                                  Container(height: 12),
                                                  CustomTextFormField(
                                                    key: viewModel
                                                        .passwordLoginFormField,
                                                    hintText: "Şifre",
                                                    controller: viewModel
                                                        .passwordLoginController,
                                                    type: TextFormFieldType
                                                        .PASSWORD,
                                                    validator: viewModel
                                                        .passwordValidator,
                                                  ),
                                                  Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .only(top: 24.0),
                                                      child: FalloraButton(
                                                          title: "Giriş",
                                                          onPressed: () =>
                                                              viewModel.login(
                                                                  context))),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 20.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () =>
                                                          context.pushNamed(
                                                              'ForgotPassword'),
                                                      text:
                                                          'Şifrenizi mi unuttunuz?',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        color:
                                                            Color(0x0039D2C0),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 12),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child:
                                                              SigninwithGoogleWidget()),
                                                      Container(
                                                        width: 12,
                                                      ),
                                                      Expanded(
                                                          child:
                                                              SigninwithAppleWidget())
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsetsDirectional.symmetric(
                                                  horizontal: 44),
                                          decoration: BoxDecoration(
                                            color: Color(0x3BFFFFFF),
                                            borderRadius: borderRadius,
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(height: 20),
                                                CustomTextFormField(
                                                  key: viewModel
                                                      .usernameRegisterField,
                                                  hintText: "Kullanıcı adı",
                                                  controller: viewModel
                                                      .usernameRegisterController,
                                                  type: TextFormFieldType.NAME,
                                                  validator: viewModel
                                                      .usernameValidator,
                                                  showEmptyButton: true,
                                                ),
                                                Container(height: 12),
                                                CustomTextFormField(
                                                  key: viewModel
                                                      .emailRegisterField,
                                                  hintText: 'E-posta',
                                                  controller: viewModel
                                                      .emailRegisterController,
                                                  type: TextFormFieldType.EMAIL,
                                                  validator:
                                                      viewModel.emailValidator,
                                                  showEmptyButton: true,
                                                ),
                                                Container(height: 12),
                                                CustomTextFormField(
                                                  key: viewModel
                                                      .passwordRegisterField,
                                                  hintText: 'Şifre',
                                                  controller: viewModel
                                                      .passwordRegisterController,
                                                  type: TextFormFieldType
                                                      .PASSWORD,
                                                  validator: viewModel
                                                      .passwordRegisterValidator,
                                                ),
                                                Container(height: 12),
                                                CustomTextFormField(
                                                  key: viewModel
                                                      .passwordConfirmField,
                                                  hintText: 'Şifre Tekrarı',
                                                  controller: viewModel
                                                      .passwordConfirmController,
                                                  type: TextFormFieldType
                                                      .PASSWORD,
                                                  validator: viewModel
                                                      .passwordConfirmValidator,
                                                ),
                                                Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 24.0,
                                                                0.0, 10.0),
                                                    child: FalloraButton(
                                                        title: "Kayıt ol",
                                                        onPressed: () =>
                                                            viewModel.register(
                                                                context))),
                                              ],
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
}

class LoginPageAppBar extends StatelessWidget {
  const LoginPageAppBar({
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
