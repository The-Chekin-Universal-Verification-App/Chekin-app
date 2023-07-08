import 'dart:math';

import 'package:chekinapp/core/core.dart';

import '../../res/res.dart';

Random random = Random(10);

class HomeProvider extends BaseProvider {
  HomeProvider() {
    init();
  }

  List<ProductModel> _topRated = [];
  List<ProductModel> _popular = [];

  List<ProductModel> get topRated => _topRated;
  List<ProductModel> get popular => _popular;

  init() {
    setBusy(true);
    Future.delayed(
        const Duration(
          seconds: 6,
        ), () {
      _topRated =
          List.generate(R.M.topRated.length, (index) => R.M.topRated[index])
              .toList();
      _popular =
          List.generate(R.M.topRated.length, (index) => R.M.topRated[index])
              .toList();

      setBusy(false);
      notifyListeners();
      print('first delay');
    });
    print('second delay');
  }
}
