import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class NumberPadController {
  final TextEditingController _controller = TextEditingController();
  final BehaviorSubject<String> _subject = BehaviorSubject.seeded('');

  String get value => _subject.value;
  BehaviorSubject<String> get stream => _subject;

  TextEditingController get textController => _controller;

  void push(String value) {
    if (_subject.value.length < 6) {
      _subject.add(_subject.value + value);
      _controller.text = _subject.value;
    }
  }

  void pop() {
    if (_subject.value.length > 0) {
      _subject.add(_subject.value.substring(0, _subject.value.length - 1));
      _controller.text = _subject.value;
    }
  }

  void clear() {
    _subject.add('');
    _controller.text = _subject.value;
  }
}
