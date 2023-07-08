import 'package:chekinapp/core/core.dart';

class MainProvider extends BaseProvider {
  int _currentNavIndex = 0;

  int get navIndex => _currentNavIndex;

  set setNavIndex(int value) {
    _currentNavIndex = value;
    notifyListeners();
  }
}
