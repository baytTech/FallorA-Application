import 'package:fallora/res/color.res.dart';
import 'package:fallora/widgets/appbar/FalloraAppBar.dart';
import 'package:fallora/widgets/notification/notification_list_tile.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'inbox_page_model.dart';
export 'inbox_page_model.dart';


class InboxPageWidget extends StatefulWidget {
  const InboxPageWidget({Key? key}) : super(key: key);

  @override
  _InboxPageWidgetState createState() => _InboxPageWidgetState();
}

class _InboxPageWidgetState extends State<InboxPageWidget> {
  late InboxPageModel _model;

  bool isHome = false;

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
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: FalloraAppBar(
          isHome: false,
          context: context,
          gradient: AppColors.appBarGradiet
        ),
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1.0,
          decoration: BoxDecoration(
            gradient: AppColors.pageGradient
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    NotificationListTile(),
                    NotificationListTile(),
                    NotificationListTile(),
                    NotificationListTile()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
