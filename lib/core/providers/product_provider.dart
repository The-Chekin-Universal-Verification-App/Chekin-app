import 'package:chekinapp/core/core.dart';

class ProductProvider extends BaseProvider {
  int _currentPage = 0;
  int _totalPages = 0;

  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;
  int get currentPage => _currentPage;
  int get totalPage => _totalPages;
  setProduct(List object, {required int currentPage, required int totalPages}) {
    _currentPage = currentPage;
    _totalPages = totalPages;
    _products = object.map((e) => ProductModel.fromJson(e)).toList();

    notifyListeners();
  }
}
