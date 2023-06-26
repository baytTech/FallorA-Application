import 'package:fallora/pages/tarot_page/tarot_cubit.dart';
import 'package:fallora/widgets/appbar/FalloraAppBar.dart';
import 'package:fallora/widgets/tarotcard/TarotCard.dart';
import 'package:fallora/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'tarot_page_model.dart';
export 'tarot_page_model.dart';

class TarotPageWidget extends StatefulWidget {
  const TarotPageWidget({Key? key}) : super(key: key);

  @override
  _TarotPageWidgetState createState() => _TarotPageWidgetState();
}

class _TarotPageWidgetState extends State<TarotPageWidget> {
  late TarotPageModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = createModel(
      context, 
      () => TarotPageModel(functionsRepo: getIt.get())
    );
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TarotCubit,TarotState>(
      bloc: viewModel.tarotCubit,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: FalloraAppBar(context: context, isHome: false),
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF3D1809), FlutterFlowTheme.of(context).accent4],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                        childAspectRatio: 0.77
                      ),
                      itemCount: 78,
                      itemBuilder:(context, index) {
                        return TarotCard(
                          key: ValueKey(index),
                          onSelectEvent: viewModel.tarotCubit.toggle
                        );
                      },
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}



// TODO: BUTTON FIELD
                  /*FlutterFlowAdBanner(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 50.0,
                    showsTestAd: true,
                  ),*/