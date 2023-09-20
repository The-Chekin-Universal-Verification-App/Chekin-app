// ignore_for_file: use_build_context_synchronously

import 'package:chekinapp/export.dart';
import 'package:flutter/cupertino.dart';

import '../../routes/whislist/whish_list.dart';
import '../providers/product_provider.dart';
import '../services/business_service.dart';

class ProductCommand extends BaseCommand {
  ProductCommand(super.c);
  AuthProvider get auth => getProvider();
  ProductProvider get product => getProvider();
  WishListProvider get wishList => getProvider();

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

  Future<void> getWishList() async {
    Response? res;
    product.setBusy(true);
    BusinessService service = BusinessService();
    try {
      wishList.setBusy(true);
      res = await service.getWishList(auth.token);
      wishList.setBusy(false);

      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          wishList.setWishList(res.data['data']['items']);
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  Future<void> addToWishList(List<String> productIds) async {
    BuildContext context = rootNav!.context;
    List<dynamic> res;
    product.setBusy(true);
    BusinessService service = BusinessService();
    try {
      wishList.setBusy(true);

      res = await service.addToWishList(auth.token, productId: productIds);
      wishList.setBusy(false);

      if (res != []) {
        MySnackBar(context: context)
            .showSnackBar(message: 'Item added to wishlist');
        // DialogServices.messageModalFromTop(context,
        //     message: 'Item added to wishlist');
        getWishList();
      } else {}
      log(res.toString());
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  Future<void> removeFromWishList(String productIds) async {
    BuildContext context = rootNav!.context;
    Response? res;
    // product.setBusy(true);
    BusinessService service = BusinessService();
    try {
      // wishList.setBusy(true);

      res = await service.removeFromWishList(auth.token, productId: productIds);
      // wishList.setBusy(false);

      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          MySnackBar(context: context).showSnackBar();
          // DialogServices.messageModalFromTop(context,
          //     message: 'Item Removed from wishlist');
          getWishList();
        }
      }
      log(res.toString());
    } catch (e) {
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
