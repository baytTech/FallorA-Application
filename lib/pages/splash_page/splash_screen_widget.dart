import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'splash_screen_model.dart';
export 'splash_screen_model.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({Key? key}) : super(key: key);

  @override
  _SplashScreenWidgetState createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  late SplashScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 1000));

      context.pushNamed(
        'MainPage',
        extra: <String, dynamic>{
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 1),
          ),
        },
      );
    });
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
        backgroundColor: Color(0xFF740097),
        body: SafeArea(
          child: Visibility(
            visible: responsiveVisibility(
              context: context,
              desktop: false,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (responsiveVisibility(
                  context: context,
                  desktop: false,
                ))
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: double.infinity,
                          maxHeight: double.infinity,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF472042), Color(0xFF740097)],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(-1.0, -1.0),
                            end: AlignmentDirectional(1.0, 1.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              50.0, 50.0, 50.0, 50.0),
                          child: Image.asset('assets/images/Fallora.png',
                            width: 0.0,
                            height: 0.0,
                            fit: BoxFit.fitWidth,
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
    );
  }
}
