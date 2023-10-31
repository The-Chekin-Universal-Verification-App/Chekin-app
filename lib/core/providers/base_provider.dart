import 'package:flutter/material.dart';

abstract class BaseProvider extends ChangeNotifier {
  bool isBusy = false;
  setBusy(bool val) {
    isBusy = val;
    notifyListeners();
  }
}
