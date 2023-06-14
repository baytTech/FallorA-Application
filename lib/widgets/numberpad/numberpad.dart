import 'package:flutter/material.dart';
import 'controller.dart';
import 'numeric_backspace.dart';
import 'numeric_input.dart';

class NumberPad extends StatefulWidget {
  final double height;
  final NumberPadController? controller;
  final BoxDecoration? padDecoration;
  final TextStyle? textStyle;
  const NumberPad({
    Key? key,
    required this.height,
    this.controller,
    this.padDecoration,
    this.textStyle,
  }) : super(key: key);

  @override
  _NumberPadState createState() => _NumberPadState();
}

class _NumberPadState extends State<NumberPad> {
  void push(String value) {
    widget.controller?.push(value);
  }

  void pop() {
    widget.controller?.pop();
  }

  @override
  Widget build(BuildContext context) {
    double height = widget.height;
    BoxDecoration? padDecoration = widget.padDecoration;
    TextStyle? textStyle = widget.textStyle;
    Size _size = Size(80, height / 6);
    return Container(
      height: height,
      decoration: padDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NumericInput(value: '1', textStyle: textStyle, size: _size, function: push),
                    NumericInput(value: '2', textStyle: textStyle, size: _size, function: push),
                    NumericInput(value: '3', textStyle: textStyle, size: _size, function: push),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NumericInput(value: '4', textStyle: textStyle, size: _size, function: push),
                    NumericInput(value: '5', textStyle: textStyle, size: _size, function: push),
                    NumericInput(value: '6', textStyle: textStyle, size: _size, function: push),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NumericInput(value: '7', textStyle: textStyle, size: _size, function: push),
                    NumericInput(value: '8', textStyle: textStyle, size: _size, function: push),
                    NumericInput(value: '9', textStyle: textStyle, size: _size, function: push),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Opacity(
                      opacity: 0,
                      child: AbsorbPointer(
                        child: NumericInput(value: '0', textStyle: textStyle, size: _size, function: push),
                      ),
                    ),
                    NumericInput(value: '0', textStyle: textStyle, size: _size, function: push),
                    BackSpace(size: _size, function: pop)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
