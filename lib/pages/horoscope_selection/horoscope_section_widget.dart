import 'dart:async';

import 'package:fallora/backend/model/gender/gender.dart';
import 'package:fallora/backend/model/gender/gender_selectable.dart';
import 'package:fallora/backend/model/horoscope/horoscope.dart';
import 'package:fallora/backend/model/horoscope/horoscope_selectable.dart';
import 'package:fallora/injection.dart';
import 'package:fallora/pages/horoscope_selection/cubit/comment.cubit.dart';
import 'package:fallora/pages/horoscope_selection/cubit/relation.cubit.dart';
import 'package:fallora/pages/horoscope_selection/seletable_items_controller.dart';
import 'package:fallora/res/image.res.dart';
import 'package:fallora/widgets/appbar/FalloraAppBar.dart';
import 'package:fallora/widgets/bottomsheet/horoscope_selection_bottom_sheet.dart';
import 'package:fallora/widgets/bottomsheet/horoscope_selection_extended_bottom_sheet.dart';
import 'package:fallora/widgets/fallora_button.dart';
import 'package:fallora/widgets/menulabel/MenuLabel.dart';
import 'package:fallora/res/color.res.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass_kit/glass_kit.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'horoscope_section_model.dart';
export 'horoscope_section_model.dart';

class HoroscopeSectionWidget extends StatefulWidget {
  const HoroscopeSectionWidget({Key? key}) : super(key: key);

  @override
  _HoroscopeSectionWidgetState createState() => _HoroscopeSectionWidgetState();
}

class _HoroscopeSectionWidgetState extends State<HoroscopeSectionWidget> {
  late HoroscopeSectionModel viewModel;
  bool isSelectedHoroscope = false;
  bool isSelectedGender = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    viewModel = createModel(
        context,
        () => HoroscopeSectionModel(
            functionsRepo: getIt(), authManager: getIt()));
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  Future<HoroscopeSelectableItem?> selectHoroscope() {
    return horoscopeSelectionBottomSheetBuilder(
            context: context, controller: viewModel.horoscopesController)
        .then((value) {
      return viewModel.commentCubit.setState(value);
    });
  }

  Future<DartRecordRelations?> 
    selectHoroscopeAndGender({
      required DualSelectableItemController<GenderSelectableItem,HoroscopeSelectableItem> controller,
      required FutureOr<DartRecordRelations?> callBack(DartRecordRelations? value)}) {
    return horoscopeSelectionExtendedBottomSheetBuilder(
      context: context,
      controller: controller,
    ).then(callBack);
  }

  get semiBorderTop => BorderRadius.only(
    topLeft: Radius.circular(30.0),
    topRight: Radius.circular(30.0),
  );

  get semiBorderBottom => BorderRadius.only(
    bottomLeft: Radius.circular(30.0),
    bottomRight: Radius.circular(30.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: FalloraAppBar(
        context: context,
        isHome: false,
        gradient: LinearGradient(colors: [Color(0xFF31113B), Color(0xFF258195)]),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 30),
              width: MediaQuery.of(context).size.width,
              height: double.infinity,
              decoration: BoxDecoration(gradient: AppColors.pageGradient),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacer(flex: 2),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Color(0x00FFFFFF),
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage('assets/images/horoscope.png'),
                          ),
                          borderRadius: semiBorderTop,
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MenuLabel(
                                text: "BURÇ YORUM",
                                padding: EdgeInsetsDirectional.only(end: 10, bottom: 5),
                              )
                            ],
                          ),
                        ),
                      ),
                      BlocBuilder<HoroscopeCommentCubit,HoroscopeSelectableItem?>(
                          bloc: viewModel.commentCubit,
                          builder: (context, state) {
                            return GlassContainer(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.28,
                              borderRadius: semiBorderBottom,                              
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFffffff).withOpacity(0.3),
                                  Color(0xFFffffff).withOpacity(0.1)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomLeft,
                              ),
                              borderColor: Colors.white12,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () => selectHoroscope(),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.44,
                                          constraints: BoxConstraints(
                                            minHeight:  MediaQuery.of(context).size.height * 0.12,
                                            maxHeight:  MediaQuery.of(context).size.height * 0.16
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(36),
                                            image: DecorationImage(
                                              image: AppImages.horosopeBackgroundAsset,
                                              fit: BoxFit.cover,
                                            )
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              if(state != null)... [
                                                Image.asset(
                                                  state.horoscope.imagePath,
                                                  width: 70,
                                                ),
                                                Text(
                                                  state.horoscope.description,
                                                  style: GoogleFonts.playfairDisplay(
                                                    color: Colors.white,
                                                    fontSize: 23.0,
                                                  )
                                                ),
                                              ],
                                            ]
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  FalloraButton(
                                    onPressed: () =>  
                                      GoRouter.of(context).go("/horoscopeCommentary", extra: {"sign": state?.horoscope}),
                                    title: 'Devamını Oku',
                                  ),
                                  Spacer(),
                                ],
                              ),
                            );
                          }),
                    ],
                  ),
                  Spacer(flex: 2),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage('assets/images/Couple_compatibility.png'),
                          ),
                          borderRadius: semiBorderTop,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(start: 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              MenuLabel(
                                text: "BURÇ UYUM",
                                padding: EdgeInsetsDirectional.only(start: 10, bottom: 5),
                              ),
                            ],
                          ),
                        ),
                      ),
                      BlocBuilder<HoroscopeRelationCubit,HoroscopeRelationState>(
                        bloc: viewModel.relationsCubit,
                        builder: (context,state) {
                          return GlassContainer(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.28,
                            borderRadius: semiBorderBottom,
                            borderColor: Colors.white12,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFffffff).withOpacity(0.3),
                                Color(0xFFffffff).withOpacity(0.1)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomLeft,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Spacer(),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      child: Expanded(
                                        child: InkWell(
                                          onTap: () => 
                                            selectHoroscopeAndGender(
                                              controller: viewModel.dualController1,
                                              callBack: (a){
                                              if(a == null) return;
                                              viewModel.relationsCubit.setProp1(a);
                                            }),
                                          child: _HoroscopeSelectionWidget(
                                            gender: (state.prop1?.param1 as GenderSelectableItem?)?.gender,
                                            horoscope: (state.prop1?.param2 as HoroscopeSelectableItem?)?.horoscope,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      child: Expanded(
                                        child: InkWell(
                                          onTap: () => 
                                            selectHoroscopeAndGender(
                                              controller: viewModel.dualController2,
                                              callBack: (a){
                                              if(a == null) return;
                                              viewModel.relationsCubit.setProp2(a);
                                            }),
                                          child: _HoroscopeSelectionWidget(
                                              gender: (state.prop2?.param1 as GenderSelectableItem?)?.gender,
                                              horoscope: (state.prop2?.param2 as HoroscopeSelectableItem?)?.horoscope,
                                          ),
                                        ),
                                      ),
                                    ),
                                  
                                  ],
                                ),
                                Spacer(),
                                FalloraButton(
                                  title: "Devamını Oku",
                                  onPressed: () =>  context.pushNamed('HoroscopeCommentary'),
                                ),
                                Spacer()
                              ],
                            ),
                          );
                        }
                      )
                    ],
                  ),
                  Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HoroscopeSelectionWidget extends StatelessWidget {
  final Horoscope? horoscope;
  final Gender? gender;
  const _HoroscopeSelectionWidget({
    this.horoscope, 
    this.gender
  });

  @override
  Widget build(BuildContext context) {
    String imagePath = horoscope == null 
      ? AppImages.questionMarkCircle 
      : horoscope?.imagePath??"";

    String text = horoscope == null
     ? "Seç"
     : "${horoscope?.description} ${gender?.description}";
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AppImages.horosopeBackgroundAsset,
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            imagePath,
            width: MediaQuery.of(context).size.width * 0.16,
          ),
          Text(
            text,
            style: GoogleFonts.playfairDisplay(
              color: Colors.white,
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}