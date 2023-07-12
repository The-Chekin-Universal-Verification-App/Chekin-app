import 'package:chekinapp/export.dart';

class WishListProvider extends BaseProvider {
  WishListProvider() {
    init();
  }

  List<ProductModel> _wishList = [];

  List<ProductModel> get wishList => _wishList;

  init() {
    setBusy(true);
    Future.delayed(
        const Duration(
          seconds: 6,
        ), () {
      _wishList =
          List.generate(R.M.topRated.length, (index) => R.M.topRated[index])
              .toList();
      _wishList =
          List.generate(R.M.topRated.length, (index) => R.M.topRated[index])
              .toList();

      setBusy(false);
      notifyListeners();
    });
  }
}
