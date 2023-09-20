import 'package:chekinapp/core/core.dart';

class ProductProvider extends BaseProvider {
  int _currentPage = 0;
  int _totalPages = 0;

  List<ProductModel> _products = [];
  List<ProductModel> _productsCopy = [];
  List<ProductModel> get products => _products;
  int get currentPage => _currentPage;
  int get totalPage => _totalPages;
  setProduct(List object, {required int currentPage, required int totalPages}) {
    _productsCopy = [];
    _currentPage = currentPage;
    _totalPages = totalPages;
    _products = object.map((e) => ProductModel.fromJson(e)).toList();

    _productsCopy = List.of(_products);
    notifyListeners();
  }

  set sortProduct(String keyWord) {
    _products = [];
    // print(keyWord);
    for (var element in _productsCopy) {
      if (element.name.contains(keyWord) ||
          element.price.toString().contains(keyWord) ||
          element.business!.name.contains(keyWord)) {
        _products.add(element);
      }
    }
    notifyListeners();
  }

  displayAllProduct() {
    _products = _productsCopy;

    notifyListeners();
  }
}
