import 'package:chekinapp/export.dart';

class WishListProvider extends BaseProvider {
  WishListProvider() {
    // init();
  }

  List<ProductModel> _myWishList = [];
  // late List<ProductModel> _myNewlyPickedWishList = [];
  List<String> _pickedWishListProductIds = [];
  List<String> get pickedWishListProductIds => _pickedWishListProductIds;
  List<ProductModel> get myWishList => _myWishList;
  // List<ProductModel> get myNewlyPickedWishList => _myNewlyPickedWishList;

  // items on list list from server
  setWishList(List wishList) {
    _myWishList = [];
    _myWishList = wishList.map((e) {
      // print(e['product']);
      return ProductModel.fromJson(e['product']);
    }).toList();
    // print(_myWishList); //
    notifyListeners();
  }

  // to be save to database
  addToWishList(ProductModel product) {
    // _myWishList=[];
    _myWishList.add(
        product); //this add item to the wish list from server but this would only as long ad the app is in used but user will loss them unless save the wish list to database.
    // _myNewlyPickedWishList=[];
    // _myNewlyPickedWishList.add(
    //     product); // this add item to the wish list and then permanently saved to database when user save their wish list.

    _pickedWishListProductIds.add(product.id);
    notifyListeners();
  }

  // to be save to database
  removeFromWishList(ProductModel product) {
    _myWishList.removeWhere((element) => product == element);

    notifyListeners();
  }

  clearIDsWishList() {
    _pickedWishListProductIds = [];
    notifyListeners();
  }
}
