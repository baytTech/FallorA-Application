
import 'package:fallora/backend/model/gender/gender_selectable.dart';
import 'package:fallora/backend/util/selectable_item.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderWidget extends StatelessWidget {
  final GenderSelectableItem item;

  const GenderWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectableItemCubit,bool>(
        bloc: item.isSelected,
        builder: (context,isSelected) {
          return AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: isSelected ? 1 : 0.4,
            child: Center(
              child: Row(
                verticalDirection: VerticalDirection.down,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedScale(
                      scale: isSelected ? 1: 0.8,
                      duration: Duration(milliseconds: 200),
                      child: Image.asset(item.gender.imagePath,width: 30)
                  ),
                  SizedBox(width: 10),
                  Text(
                      item.gender.description,
                      style: GoogleFonts.poppins(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      )
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
