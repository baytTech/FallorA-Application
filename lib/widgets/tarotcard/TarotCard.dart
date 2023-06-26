import 'dart:ffi';

import 'package:fallora/flutter_flow/flutter_flow_theme.dart';
import 'package:fallora/res/color.res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neon_widgets/neon_widgets.dart';

class TarotCard extends StatefulWidget {
  final bool Function(bool) onSelectEvent;
  const TarotCard({super.key, required this.onSelectEvent});

  @override
  State<TarotCard> createState() => _TarotCardState();
}

class _TarotCardState extends State<TarotCard> {
  bool selectionState = false;

  void onSelectEvent() {
      setState(() {
          selectionState = widget.onSelectEvent.call(selectionState);;
      });
  }

  @override
  Widget build(BuildContext context) {
    String tarotCardImagePath = "assets/images/Tarot_card_example.png";
    return InkWell(
      onTap: onSelectEvent,
      child: AnimatedContainer(
        duration: 200.milliseconds,
        padding: selectionState ? EdgeInsets.zero : EdgeInsetsDirectional.all(5.0),
        child: NeonContainer(
          spreadColor: selectionState ? Colors.teal.shade200 : Colors.transparent,
          borderColor: selectionState ? Colors.teal.shade50 : Colors.transparent,
          containerColor: AppColors.transparent,
          lightBlurRadius: 20,
          lightSpreadRadius: 10,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.09,
            height: MediaQuery.of(context).size.height * 0.06,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              image: DecorationImage(fit: BoxFit.fill, image: AssetImage(tarotCardImagePath)),
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
      ),
    );
  }
}
