import 'dart:developer';

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

  //-------------------------------------------------------------------------
  //-------------------------------------------------------------------------
  ///user uploaded product
  ///
  List<ProductModel> _myUploadedProducts = [];
  List<ProductModel> get myUploadedProducts => _myUploadedProducts;
  int _myProductCurrentPage = 0;
  int _myProductTotalPages = 0;

  int get myProductTotalPages => _myProductTotalPages;
  int get myProductCurrentPage => _myProductCurrentPage;

  setMyProduct(List object,
      {required int currentPage, required int totalPages}) {
    _myProductCurrentPage = currentPage;
    _myProductTotalPages = totalPages;
    _myUploadedProducts = object.map((e) => ProductModel.fromJson(e)).toList();

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

  List<String> _uploadedProductsUrl = [];
  List<String> get uploadedProductsUrl => _uploadedProductsUrl;
  set keepUploadedProduct(String product) {
    _uploadedProductsUrl.add(product);
    notifyListeners();
  }

  set removeImageFromList(String item) {
    _uploadedProductsUrl.removeWhere((element) => element == item);
    notifyListeners();
  }

  clearImageFromList() {
    _uploadedProductsUrl = [];
    notifyListeners();
  }

  List<ProductCategoryModel> _productCategory = [];
  List<ProductCategoryModel> get productCategory => _productCategory;
  set setCategory(List category) {
    // log(category.toString());
    _productCategory =
        category.map((e) => ProductCategoryModel.fromJson(e)).toList();
    notifyListeners();
  }
}
