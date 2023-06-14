import 'package:flutter/material.dart';

class BackSpace extends StatelessWidget {
  final Function? function;
  final Size size;
  const BackSpace({
    Key? key,
    this.function,
    this.size = const Size(70, 60),
  }) : super(key: key);

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
              onTap: () => function?.call(),
              borderRadius: BorderRadius.circular(20),
              // splashColor: AppColors.darkBlue,
              child: Icon(
                Icons.backspace,
                size: (size.height) / 1.6,
                color: const Color(0xFFCCE0F7),
              ),
            ),
          ),
        )
      ],
    );
  }
}
