import 'package:fallora/flutter_flow/flutter_flow_theme.dart';
import 'package:fallora/res/color.res.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';

class TarotCard extends StatefulWidget {
  const TarotCard({super.key});

  @override
  State<TarotCard> createState() => _TarotCardState();
}

class _TarotCardState extends State<TarotCard> {

  FlipCardController cardController = FlipCardController();
  bool isCardFlippable = true;

  @override
  Widget build(BuildContext context) {
    String tarotCardImagePath = "assets/images/Tarot_card_example.png";
    String networkImage = "https://storage.googleapis.com/fallora.appspot.com/tarrots/04711111-8a61-430e-bad1-5393a891c678.jpg?GoogleAccessId=firebase-adminsdk-m7joi%40fallora.iam.gserviceaccount.com&Expires=16447006800&Signature=PNhQ6ZZ%2FnIld84Z4dh8A0%2Fs4b95q3JCpCA6BQuaymc79ehXOBVxZYb16J8zmz2nsEPpcOtSlQD9dDOyxSCrgp%2BKqM%2BRfBP2%2Bh0P7%2FadVmxV0OFJrjBufw%2BDGN5g%2FEHq8KIpipTyYgkn5syDGMEZ4kTasD07aZ65S68FlWaRqujq3TK%2Fe%2BmVofp%2BzM7iN6pzwHbg%2FYvlXKLF0%2FRmJTEqM3MtKykyVOYKjSTWnmeG4zmk8lVUcFq6M5A9iDMu2S3Wc4nBO3iaJLE3n2Kr749noNLh%2BnUJgWQR1%2FS7%2FqIrixDWZf1dxI3ugbZ8qzhAdlq2gv4mgbSAPfWzkBaSiNBQ4yQ%3D%3D";
    return FlipCard(
      flipOnTouch: isCardFlippable,
      onFlipDone: (isFront) {
        setState(() {
          isCardFlippable = !isFront;
        });
      },
      controller: cardController,
      front: Padding(
        padding: EdgeInsetsDirectional.all(10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.09,
          height: MediaQuery.of(context).size.height * 0.06,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(fit: BoxFit.fill,image: AssetImage(tarotCardImagePath)),
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                  color: Color(0xC0000000),
                  offset: Offset(0.0, 2.0),
                )
              ],
            ),
          ),
        ),
      back: Padding(
        padding: const EdgeInsetsDirectional.all(5.0),
        child: NeonContainer(
          spreadColor: Colors.teal.shade200,
          borderColor: Colors.teal.shade50,
          containerColor: AppColors.transparent,
          lightBlurRadius: 20,
          lightSpreadRadius: 10,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.09,
            height: MediaQuery.of(context).size.height * 0.06,
            decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(fit: BoxFit.fill,image: NetworkImage(networkImage)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0xC0000000),
                  offset: Offset(0.0, 2.0),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
