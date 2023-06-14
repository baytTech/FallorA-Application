import 'package:fallora/backend/model/horoscope/horoscope.dart';
import 'package:fallora/backend/model/horoscope/horoscope_selectable.dart';
import 'package:fallora/pages/horoscope_selection/seletable_items_controller.dart';
import 'package:fallora/res/color.res.dart';
import 'package:fallora/widgets/horoscope/HoroscopeWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<HoroscopeSelectableItem?> horoscopeSelectionBottomSheetBuilder({
  required BuildContext context,
  required SelectableItemController<HoroscopeSelectableItem> controller,
}) {
  return showModalBottomSheet<HoroscopeSelectableItem?>(
      context: context,
      isDismissible: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        var scrollController = FixedExtentScrollController(initialItem: controller.previousSelected);
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
                decoration: BoxDecoration(color: Colors.white70,borderRadius: BorderRadius.circular(20)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Burç Seçiniz",
                      style: GoogleFonts.poppins(
                          color: Colors.white60,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.4,
                          fontSize: 15),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(controller.currentItem),
                      child: Text("Seç",
                      style: GoogleFonts.poppins(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.4,
                          fontSize: 16
                        ),
                      )
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListWheelScrollView.useDelegate(
                      onSelectedItemChanged: controller.onItemChanged,
                      magnification: 0.1,
                      itemExtent: 100,
                      controller: scrollController,
                      perspective: 0.002,
                      diameterRatio: 1.4,
                      physics: FixedExtentScrollPhysics(),
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: Horoscope.values.length,
                        builder: (context, index) {
                          return HoroscopeWidget(
                            key: ValueKey(index),
                            item: controller.items[index],
                          );
                        },
                      ))),
            ],
          ),
        );
      });
}
