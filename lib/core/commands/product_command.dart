// ignore_for_file: use_build_context_synchronously

import 'package:chekinapp/export.dart';

import '../providers/product_provider.dart';
import '../services/business_service.dart';

class ProductCommand extends BaseCommand {
  ProductCommand(super.c);
  AuthProvider get auth => getProvider();
  ProductProvider get product => getProvider();

  Future<void> getProducts(
      {String page = '1', String limit = '10', String search = ''}) async {
    Response? res;
    product.setBusy(true);
    BusinessService service = BusinessService();
    // String path = _getPath(page: page, limit: limit, search: search);//decommissioned for now
    try {
      res = await service.getProducts(auth.token, urlPath: 'path');
      product.setBusy(false);
      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          product.setProduct(
            res.data['data']['data'],
            currentPage: res.data['data']['currentPage'],
            totalPages: res.data['data']['totalPages'],
          );
        }
      }
    } catch (e) {
      product.setBusy(false);

      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  String _getPath({String page = '', String limit = '', String search = ''}) {
    String searchKey = "?page=$page&limit=$limit&search=$search";

    if (limit == '' && search == '' && page == '') {
      searchKey = '';
    } else if (limit == '' && search == '') {
      searchKey = "?page=$page";
    } else if (search == '') {
      searchKey = "?page=$page&limit=$limit";
    } else if (limit == '') {
      searchKey = "?page=$page&search=$search";
    } else if (page == '') {
      searchKey = "";
    } else {
      searchKey = "?page=$page&limit=$limit&search=$search";
    }
    return searchKey;
  }
}
