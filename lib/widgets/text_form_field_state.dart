import 'package:flutter/material.dart';

abstract class TextFormFieldState<T extends StatefulWidget> extends State<T> {
  bool validate();
  void reset();
  void update();
}