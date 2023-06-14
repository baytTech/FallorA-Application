import 'package:flutter/material.dart';

class NumericInput extends StatelessWidget {
  final String value;
  final TextStyle? textStyle;
  final Size size;
  final Function(String)? function;

  const NumericInput({Key? key, required this.value, this.textStyle, this.function, this.size = const Size(70, 50)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.zero,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () => function?.call(value),
              borderRadius: BorderRadius.circular(20),
              // splashColor: AppColors.darkBlue,
              child: Center(
                child: Text(value, textAlign: TextAlign.center, style: textStyle),
              ),
            ),
          ),
        )
      ],
    );
  }
}
