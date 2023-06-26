import 'dart:ui';

import 'package:fallora/widgets/fallora_button.dart';
import 'package:fallora/nav.dart';
import 'package:fallora/res/color.res.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            backgroundColor: AppColors.transparent,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.12),
              child: AppBar(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(100.0, 50.0, 100.0, 5.0),
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
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(70.0),
                  child: Container(),
                ),
                centerTitle: false,
              ),
          ),
          body: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 60),
            child: ClipRRect(
              borderRadius: BorderRadius. circular (25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15,sigmaY: 15),
                child: Container(
                  width: 350,
                  height: 400,
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
                        LottieBuilder.asset(
                          "assets/lottie_animations/success_lottie_anim.json",
                          repeat: false,
                          height: 150,
                        ),
                        Text(
                          "Kayıt Başarılı",
                          style: GoogleFonts.poppins(
                            color: Colors.white70,
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Tebrikler! E-postanız doğrulandı\nve kaydınız başarıyla tamamlandı",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.white70,
                            fontSize: 13
                          ),
                        ),
                        SizedBox(height: 28),
                        FalloraButton(
                          title: "Giriş yap",
                          onPressed: () => GoRouter.of(context).go("/loginPage")
                        )  
                    ]
                  ),
                ),
              ),
            )
          ),
        )
      ],
    );
  }
}
