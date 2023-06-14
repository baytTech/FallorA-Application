import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

    FFAppState._internal();

    Future initializePersistedState() async {}

    void update(VoidCallback callback) {
      callback();
      notifyListeners();
    }
  }
