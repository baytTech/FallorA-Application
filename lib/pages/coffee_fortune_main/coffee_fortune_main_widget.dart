import 'package:fallora/res/color.res.dart';
import 'package:fallora/widgets/appbar/FalloraAppBar.dart';
import 'package:fallora/widgets/menulabel/MenuLabel.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modals/bottom_sheet/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'coffee_fortune_main_model.dart';
export 'coffee_fortune_main_model.dart';

class CoffeeFortuneMainWidget extends StatefulWidget {
  const CoffeeFortuneMainWidget({Key? key}) : super(key: key);

  @override
  _CoffeeFortuneMainWidgetState createState() =>
      _CoffeeFortuneMainWidgetState();
}

class _CoffeeFortuneMainWidgetState extends State<CoffeeFortuneMainWidget> {
  late CoffeeFortuneMainModel viewModel;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    viewModel = createModel(context, () => CoffeeFortuneMainModel());
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
        backgroundColor: Color(0xFF4E4E4E),
        appBar: FalloraAppBar(
          context: context, 
          isHome: false, 
          gradient: AppColors.appBarGradiet
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(gradient: AppColors.pageGradient),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(bottom: 30.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.only(bottom: 100.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.all(10.0),
                                                child: InkWell(
                                                  onTap: () => GoRouter.of(context).push("/sendCoffeeCup"),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: MediaQuery.of(context).size.height * 0.12,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage('assets/images/coffee_2.png'),
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:Color(0xB2FFFFFF),
                                                          offset:Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:BorderRadius.circular(20.0),
                                                    ),
                                                    child: MenuLabel (
                                                      text: "FİNCAN GÖNDER",
                                                      padding: EdgeInsetsDirectional.only(bottom: 5.0),
                                                    )
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:EdgeInsetsDirectional.symmetric(horizontal: 20),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.all(10.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: MediaQuery.of(context).size.height *0.12,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.fitWidth,
                                                      image: AssetImage('assets/images/Fallora_drinks_coffee.png',),
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color: Color(0xB2FFFFFF),
                                                        offset: Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:BorderRadius.circular(20.0),
                                                  ),
                                                  child: MenuLabel(
                                                    text: "YERİME İÇ",
                                                    padding: EdgeInsetsDirectional.only(bottom: 5.0),
                                                  )
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Color(0x3C000000),
                                enableDrag: false,
                                context: context,
                                builder: (bottomSheetContext) {
                                  return GestureDetector(
                                    onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                    child: Padding(
                                      padding:MediaQuery.of(bottomSheetContext).viewInsets,
                                      child: Container(
                                        height: MediaQuery.of(context).size.height * 0.4,
                                        child: BottomSheetWidget(),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            child: Container(
                              width: 100.0,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5.0,
                                    color: Color(0x7D000000),
                                    offset: Offset(0.0, -2.0),
                                  )
                                ],
                                gradient: LinearGradient(
                                  colors: [
                                    FlutterFlowTheme.of(context).primary,
                                    FlutterFlowTheme.of(context).secondary
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: AlignmentDirectional(0.0, -1.0),
                                  end: AlignmentDirectional(0, 1.0),
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                ),
                              ),
                              child: Icon(
                                Icons.keyboard_arrow_up,
                                color: Colors.white,
                                size: 40.0,
                              ),
                            ),
                          ),
                        ),
                      FlutterFlowAdBanner(
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: 50.0,
                        showsTestAd: true,
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
