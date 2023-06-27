import 'dart:core';

import 'package:fallora/backend/model/gender/gender.dart';
import 'package:fallora/backend/model/gender/gender_selectable.dart';
import 'package:fallora/backend/model/horoscope/horoscope.dart';
import 'package:fallora/backend/model/horoscope/horoscope_selectable.dart';
import 'package:fallora/domain/model/record/dart_record.dart';
import 'package:fallora/pages/horoscope_selection/seletable_items_controller.dart';
import 'package:fallora/res/color.res.dart';
import 'package:fallora/widgets/gender/GenderWidget.dart';
import 'package:fallora/widgets/horoscope/HoroscopeWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<DartRecord<GenderSelectableItem,HoroscopeSelectableItem>?> horoscopeSelectionExtendedBottomSheetBuilder({
  required BuildContext context,
  required DualSelectableItemController<GenderSelectableItem,HoroscopeSelectableItem> controller,
}) {
  return showModalBottomSheet<DartRecord<GenderSelectableItem,HoroscopeSelectableItem>?>(
      context: context,
      isDismissible: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        List<GenderSelectableItem> genderItems = controller.items1;
        List<HoroscopeSelectableItem> horoscopeItems = controller.items2;
        var genderController = FixedExtentScrollController(
            initialItem: controller.previousSelected1);
        var horoscopeController = FixedExtentScrollController(
            initialItem: controller.previousSelected2);
        return Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            gradient: LinearGradient(
                colors: [Color(0xFF4E4E4E),Color(0xFF4E4E4E),Color(0xFF181818)],
                stops: [0.0,0.5,1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 6,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(20)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(DartRecord(controller.currentItem1, controller.currentItem2)),
                      child: Text(
                      "Seç",
                      style: GoogleFonts.poppins(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.4,
                          fontSize: 16),
                    ))
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: ListWheelScrollView.useDelegate(
                            onSelectedItemChanged: controller.onItemChanged1,
                            magnification: 0.1,
                            itemExtent: 50,
                            perspective: 0.002,
                            diameterRatio: 1.4,
                            controller: genderController,
                            physics: FixedExtentScrollPhysics(),
                            childDelegate: ListWheelChildBuilderDelegate(
                              childCount: Gender.values.length,
                              builder: (context, index) {
                                return GenderWidget(
                                  key: ValueKey(index),
                                  item: genderItems[index],
                                );
                              },
                            ))),
                    Expanded(
                        child: ListWheelScrollView.useDelegate(
                            onSelectedItemChanged: controller.onItemChanged2,
                            magnification: 0.1,
                            itemExtent: 100,
                            perspective: 0.002,
                            diameterRatio: 1.4,
                            controller: horoscopeController,
                            physics: FixedExtentScrollPhysics(),
                            childDelegate: ListWheelChildBuilderDelegate(
                              childCount: Horoscope.values.length,
                              builder: (context, index) {
                                return HoroscopeWidget(
                                  key: ValueKey(index),
                                  item: horoscopeItems[index],
                                );
                              },
                            ))),
                  ],
                ),
              ),
            ],
          ),
        );
      });
}
