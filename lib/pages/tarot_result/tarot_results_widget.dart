import 'package:fallora/res/color.res.dart';
import 'package:fallora/widgets/appbar/FalloraAppBar.dart';
import 'package:fallora/widgets/menulabel/MenuLabel.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'tarot_results_model.dart';
export 'tarot_results_model.dart';

class TarotResultsWidget extends StatefulWidget {
  const TarotResultsWidget({Key? key}) : super(key: key);

  @override
  _TarotResultsWidgetState createState() => _TarotResultsWidgetState();
}

class _TarotResultsWidgetState extends State<TarotResultsWidget> {
  late TarotResultsModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = createModel(context, () => TarotResultsModel());
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: FalloraAppBar(
        context: context, 
        isHome: false,
        gradient: AppColors.appBarGradiet,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: AppColors.pageGradient
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                color: AppColors.transparent,
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage('assets/images/tarot.png'),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: MenuLabel(text: "TAROT YORUMU",alignment: Alignment.centerLeft,)
              ),
            ),           
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlutterFlowAdBanner(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: 50.0,
                  showsTestAd: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}