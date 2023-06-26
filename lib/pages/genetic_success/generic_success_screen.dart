import 'dart:ui';

import 'package:fallora/domain/model/generic_success_model.dart';
import 'package:fallora/res/color.res.dart';
import 'package:fallora/widgets/appbar/FalloraAppBar.dart';
import 'package:fallora/widgets/fallora_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class GenericSuccessScreen extends StatefulWidget {
  final GenericSuccessModel pageModel;
  const GenericSuccessScreen({super.key, required this.pageModel});

  @override
  State<GenericSuccessScreen> createState() => _GenericSuccessScreenState();
}

class _GenericSuccessScreenState extends State<GenericSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    GenericSuccessModel model = widget.pageModel;
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 1.0,
          decoration: BoxDecoration(
            gradient: AppColors.pageGradient
          ),
        ),
        Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: FalloraAppBar(
            context: context,
            isHome: true,
            gradient: LinearGradient(
              colors: [Color(0xFF31113B), Color(0xFF258195)],
            ),
          ),
          body: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal:30,vertical: 80),
            child: ClipRRect(
              borderRadius: BorderRadius. circular(25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15,sigmaY: 15),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white70, Colors.white30]),
                    border: Border.all(width: 2, color: Colors.white30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        if(model.animation != null)... [
                          LottieBuilder.asset(
                            model.animation.toString(),
                            repeat: false,
                            height: 150,
                          ),
                        ],
                        if(model.title != null)... [
                          Text(
                            model.title.toString(),
                            style: GoogleFonts.poppins(
                              color: Colors.white70,
                              fontSize: 22,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ],
                        SizedBox(height: 12),
                        if(model.description != null)...[
                          Text(
                            model.description.toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Colors.white70,
                              fontSize: 14
                            ),
                          ),
                        ],
                        SizedBox(height: 28),
                        FalloraButton(
                          title: model.buttonText.toString(),
                          onPressed: model.action
                        ),
                        SizedBox(height: 28),
                    ]
                  ),
                ),
              ),
            )
          ),
       
        ),
      ],
    );
  }
}
