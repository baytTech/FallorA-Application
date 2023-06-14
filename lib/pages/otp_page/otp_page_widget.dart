
import 'dart:developer';
import 'dart:ui';

import 'package:fallora/widgets/fallora_button.dart';
import 'package:fallora/widgets/numberpad/numberpad.dart';
import 'package:fallora/flutter_flow/flutter_flow_model.dart';
import 'package:fallora/injection.dart';
import 'package:fallora/pages/otp_page/otp_page_model.dart';
import 'package:fallora/res/color.res.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class OtpPageWidget extends StatefulWidget {
  final String email;

  const OtpPageWidget({
    super.key,
    required this.email
  });

  @override
  State<OtpPageWidget> createState() => _OtpPageWidgetState();
}

class _OtpPageWidgetState extends State<OtpPageWidget> {

  late ValidationViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = createModel(
        context,
        () => ValidationViewModel(functionsRepo: getIt.get(), localRepo: getIt.get()));
    viewModel.email = widget.email;
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/a_mystical_woman_with_horns_drinks_turkish_coffee_2.png'),
             ),
          )
        ),
        SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Center(
                    child: Image.asset('assets/images/Fallora_narrow.png',
                      width: 250,
                      height: double.infinity,
                      fit: BoxFit.contain
                    ),
                  ),
                )
            ),
            backgroundColor: AppColors.transparent,
            body: Container(
              alignment: Alignment.bottomCenter,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15,sigmaY: 15),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.5),
                    gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.white70]),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(26))
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Spacer(flex: 4),
                      Text(
                        "E-postanıza gelen 6 haneli kodu giriniz",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          //color: AppColors.darkBlue,
                        ),
                      ),
                      Spacer(flex: 2),
                      StreamBuilder(
                        stream: viewModel.numberPadController.stream,
                        builder: (context, snapshot) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: PinCodeTextField(
                              autoDisposeControllers: false,
                              showCursor: false,
                              focusNode: AlwaysDisabledFocusNode(),
                              readOnly: true,
                              enablePinAutofill: false,
                              controller: viewModel.numberPadController.textController,
                              length: 6,
                              hapticFeedbackTypes: HapticFeedbackTypes.vibrate,
                              backgroundColor: Colors.transparent,
                              useHapticFeedback: true,
                              appContext: context,
                              errorAnimationController: viewModel.errorController,
                              errorAnimationDuration: 400,
                              pinTheme: PinTheme(
                                fieldWidth: 30,
                                activeColor: AppColors.secondaryColor,
                                inactiveColor: Colors.grey[400],
                                errorBorderColor: Colors.red,
                              ),
                              onChanged: (_) {},
                            ),
                          );
                        },
                      ),
                      Spacer(flex: 2),
                      NumberPad(
                        controller: viewModel.numberPadController,
                        height: 250,
                        textStyle: TextStyle(
                          fontSize: 26,
                        ),
                      ),
                      Spacer(flex: 2),
                      StreamBuilder(
                        stream: viewModel.numberPadController.stream,
                        builder: (context,snapshot) {
                          return FalloraButton(
                            title: "Devam Et",
                            height: 55,
                            enabled: snapshot.data.toString().length == 6,
                            onPressed: snapshot.data.toString().length == 6 ?  () {
                                viewModel.verifyOtp(context);
                            }: null,
                          );
                        },
                      ),
                      
                      Spacer(flex: 1),
                      TextButton(
                        onPressed: () {
                          viewModel.numberPadController.clear();
                        },
                        child: Text(
                          "Kodu Tekrar Gönder",
                          style: TextStyle(
                            //color: AppColors.darkBlue,
                            fontSize: 13,
                            color: AppColors.white,
                            decoration: TextDecoration.underline,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
