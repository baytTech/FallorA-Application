
import 'package:fallora/backend/auth/user.cubit.dart';
import 'package:fallora/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../backend/auth/auth.manager.dart';
import '../../backend/model/user/user.dart';
import '../../injection.dart';

import 'package:badges/badges.dart' as badges;


class FalloraAppBar extends StatefulWidget implements PreferredSizeWidget {

  final BuildContext context;
  const FalloraAppBar({required this.context});

  @override
  State<FalloraAppBar> createState() => _FalloraAppBarState();
  
  
  @override
  Size get preferredSize => Size.fromHeight(appbarHeight);
  double get appbarHeight => MediaQuery.of(context).size.height * 0.1;

}

class _FalloraAppBarState extends State<FalloraAppBar> {
  late AuthManager authManager = getIt<AuthManager>();

  @override
  Widget build(BuildContext context) {    
    var appbarHeight = widget.appbarHeight;
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
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 4),
                        child: FaIcon(
                          FontAwesomeIcons.solidStar,
                          color: Color(0xFFFFBC00),
                          size: 18.0,
                        ),
                      ),
                      BlocBuilder<UserCubic,User?>(
                          bloc: authManager.userCubic,
                          builder: (context, state) {
                            if (state == null) return Container();
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 10.0, 5.0),
                              child: Text(
                                  "${state.appPoint.toStringAsFixed(0)}",
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
        child: Image.asset('assets/images/Fallora_narrow.png',
          width: MediaQuery.of(context).size.width * 0.4,
          height: appbarHeight,
          fit: BoxFit.contain,
        ),
      ),
      centerTitle: true,
      leading: Container(
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
          child: Icon(
            Icons.mail_outlined,
            color: Colors.white,
            size: 36.0,
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          width: MediaQuery.of(context).size.width * 0.26,
          height: appbarHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF40113B), Color(0xFF730195)],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
          ),
        ),
      ),
      elevation: 0.0,
    );
  }
}
