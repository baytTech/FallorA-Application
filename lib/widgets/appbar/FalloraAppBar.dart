import 'dart:async';

import 'package:fallora/backend/auth/user.cubit.dart';
import 'package:fallora/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fallora/nav.dart';
import 'package:shimmer/shimmer.dart';
import '../../backend/auth/auth.manager.dart';
import '../../backend/model/user/user.dart';
import '../../injection.dart';
import 'package:badges/badges.dart' as badges;

// ignore: must_be_immutable
class FalloraAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Gradient? gradient;
  final bool isHome;
  final BuildContext context;
  bool shimmerEnabled;
  final int? shimmeringDurationAsSeconds;
  FalloraAppBar({
    required this.context,
      this.gradient,
      required this.isHome,
      this.shimmerEnabled = false,
      this.shimmeringDurationAsSeconds
  });

  @override
  State<FalloraAppBar> createState() => _FalloraAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(appbarHeight);
  double get appbarHeight => MediaQuery.of(context).size.height * 0.1;
}

class _FalloraAppBarState extends State<FalloraAppBar> {
  late AuthManager authManager = getIt<AuthManager>();

  @override
  void initState() {
    super.initState();
    if (widget.shimmeringDurationAsSeconds != null) {
      Timer(Duration(seconds: widget.shimmeringDurationAsSeconds!), () {
        setState(() {
          widget.shimmerEnabled = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double appbarHeight = widget.appbarHeight;
    return AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        toolbarHeight: appbarHeight,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0x00FFFFFF),
        actions: [
          Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 6),
                child: InkWell(
                  onTap: () => context.pushNamed('StarsSell'),
                  child: Container(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 4, vertical: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFF2B022B),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.symmetric(horizontal: 4),
                          child: FaIcon(
                            FontAwesomeIcons.solidStar,
                            color: Color(0xFFFFBC00),
                            size: 18.0,
                          ),
                        ),
                        BlocBuilder<UserCubic, User?>(
                            bloc: authManager.userCubic,
                            builder: (context, state) {
                              if (state == null) return Container();
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    3.0, 0.0, 10.0, 5.0),
                                child:
                                    Text("${state.appPoint.toStringAsFixed(0)}",
                                        maxLines: 1,
                                        style: GoogleFonts.playfairDisplay(
                                          color: Colors.white,
                                          fontSize: 18,
                                        )),
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
        title: Container(
          child: Image.asset(
            'assets/images/Fallora_narrow.png',
            width: MediaQuery.of(context).size.width * 0.4,
            height: appbarHeight,
            fit: BoxFit.contain,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            GoRouter.of(context).go('/inboxPage');
          },
          child: Container(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 0.0, 0.0),
            child: badges.Badge(
                /*badgeContent: Text(
                  '1',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: Colors.white),
                ),*/
                showBadge: false,
                shape: badges.BadgeShape.circle,
                badgeColor: Color(0xFFEF393C),
                elevation: 4.0,
                padding: EdgeInsetsDirectional.all(8.0),
                position: badges.BadgePosition.topStart(),
                animationType: badges.BadgeAnimationType.scale,
                toAnimate: true,
                child: widget.isHome == true
                    ? IconButton(
                        icon: Icon(
                          Icons.mail_outlined,
                          color: Colors.white,
                          size: 36.0,
                        ),
                        onPressed: () {
                          GoRouter.of(context).go('/inboxPage');
                        },
                      )
                    : IconButton(
                        onPressed: () {
                          context.safePop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 36.0,
                        ),
                      )),
          ),
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: widget.shimmerEnabled
              ? ShimmeringBackground(widget: widget, appbarHeight: appbarHeight)
              : StaticBackground(widget: widget, appbarHeight: appbarHeight),
        ));
  }
}

class ShimmeringBackground extends StatelessWidget {
  const ShimmeringBackground({
    super.key,
    required this.widget,
    required this.appbarHeight,
  });

  final FalloraAppBar widget;
  final double appbarHeight;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      baseColor: widget.gradient?.colors.first ?? Color(0xFF40113B),
      highlightColor: widget.gradient?.colors.last ?? Color(0xFF730195),
      period: Duration(seconds: 5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.26,
        height: appbarHeight,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white30)),
          gradient: widget.gradient ??
              LinearGradient(
                colors: [Color(0xFF40113B), Color(0xFF730195)],
                stops: [0.0, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
        ),
      ),
    );
  }
}

class StaticBackground extends StatelessWidget {
  const StaticBackground({
    super.key,
    required this.appbarHeight,
    required this.widget,
  });

  final double appbarHeight;
  final FalloraAppBar widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.26,
      height: appbarHeight,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white30)),
        gradient: widget.gradient ??
            LinearGradient(
              colors: [Color(0xFF40113B), Color(0xFF730195)],
              stops: [0.0, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
      ),
    );
  }
}
