// ignore_for_file: use_build_context_synchronously

import 'package:chekinapp/export.dart';
import 'package:flutter/cupertino.dart';
import 'package:mime_type/mime_type.dart';

import '../../routes/whislist/whish_list.dart';
import '../providers/product_provider.dart';
import '../services/business_service.dart';
import 'package:flutter/material.dart';

import 'package:http_parser/http_parser.dart';

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

  Future<void> getMyUploadedProducts(
      {String page = '1', String limit = '10', String search = ''}) async {
    Response? res;
    product.setBusy(true);
    BusinessService service = BusinessService();
    try {
      res = await service.getMyUploadedProducts(auth.token, urlPath: 'path');
      product.setBusy(false);
      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          product.setMyProduct(
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

  Future<void> getCategory() async {
    Response? res;
    product.setBusy(true);
    BusinessService service = BusinessService();
    try {
      wishList.setBusy(true);
      res = await service.getCategory(auth.token);
      wishList.setBusy(false);

      if (res != null) {
        if (res.statusCode == 200 && res.data['status'] == "success") {
          product.setCategory = res.data['data'];
          log(res.data);
        }
      }
    } catch (e) {
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

  ///this is use to upload product
  Future<void> upLoadProducts(String imagePath,
      {Function()? onSuccessAction}) async {
    BuildContext context = rootNav!.context;
    Response? res;
    String fileName = imagePath;
    Map<String, dynamic> payload = {};
    if (imagePath != '') {
      fileName = imagePath.split('/').last;
      String? mimeType = mime(imagePath);
      String? mimee = mimeType?.split('/')[0];
      String? type = mimeType?.split('/')[1];

      ///add the image to the payload
      payload = {
        'image': await MultipartFile.fromFile(imagePath.trim(),
            filename: fileName, contentType: MediaType(mimee!, type!))
      };
      //Add if only it's not an empty string
      // print(imagePath);
    }

    final formData = FormData.fromMap(payload);

    BusinessService service = BusinessService();
    try {
      product.setBusy(true);
      res = await service.uploadProducts(auth.token, formData,
          onSendProgress: (a, b) {});
      product.setBusy(false);

      if (res != null) {
        if (res.statusCode == 200 && res.data['status'] == 'success') {
          log(res.data.toString());
          product.keepUploadedProduct = res.data['data']['fileUrl'];

          if (onSuccessAction != null) {
            onSuccessAction(); //call this onSuccessAction function
          }
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  Future<void> addProductToBusinessListOfProducts(ProductModel model) async {
    BuildContext context = rootNav!.context;
    Response? res;
    product.setBusy(true);
    BusinessService service = BusinessService();
    try {
      product.setBusy(true);

      res = await service.addProductToBusinessListOfProduct(auth.token,
          payload: model.toJson());
      product.setBusy(false);

      if (res != null) {
        if (res.statusCode == 201) {
          Navigator.of(context).pop();
          MySnackBar(context: context)
              .showSnackBar(message: 'Product added successfully!');
          product.clearImageFromList();
          getMyUploadedProducts();
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  Future<void> editAddedProductOnBusinessProducts(ProductModel model) async {
    BuildContext context = rootNav!.context;
    Response? res;
    product.setBusy(true);
    BusinessService service = BusinessService();
    try {
      product.setBusy(true);

      res = await service.editAddedProductOnBusinessProducts(auth.token,
          payload: model.toJson(), productId: model.id);
      product.setBusy(false);

      if (res != null) {
        if (res.statusCode == 200) {
          Navigator.of(context).pop();
          MySnackBar(context: context)
              .showSnackBar(message: 'Product edited successfully!');

          getMyUploadedProducts();
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  Future<void> deleteAddedProductOnBusinessProducts(ProductModel model) async {
    BuildContext context = rootNav!.context;
    Response? res;

    BusinessService service = BusinessService();
    try {
      product.setDeleteBusy = true;

      res = await service.deleteAddedProductOnBusinessProducts(auth.token,
          productId: model.id);
      product.setDeleteBusy = false;
      if (res != null) {
        if (res.statusCode == 200) {
          Navigator.of(context).pop;
          MySnackBar(context: context)
              .showSnackBar(message: 'Product removed successfully!');

          getMyUploadedProducts();
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  ///decommissioned code
  ///
  ///

// Future<void> upLoadMultipleProducts(List<String> imagePaths,
//       {Function()? onSuccessAction}) async {
//     List<MultipartFile> multipartFiles = [];
//     Map<String, dynamic> payload = {};
//     BuildContext context = rootNav!.context;
//     Response? res;
//     for (int i = 0; i < imagePaths.length; i++) {
//       String fileName = imagePaths[i];
//
//       if (imagePaths[i] != '') {
//         fileName = imagePaths[i].split('/').last;
//         String? mimeType = mime(imagePaths[i]);
//         String? mimee = mimeType?.split('/')[0];
//         String? type = mimeType?.split('/')[1];
//
//         ///add the image to the payload
//         MultipartFile preparedImage = await MultipartFile.fromFile(
//             imagePaths[i].trim(),
//             filename: fileName,
//             contentType: MediaType(mimee!, type!));
//
//         //add image to list of multipartFile
//         multipartFiles.add(preparedImage);
//       }
//     }
//
//     payload = {'image': multipartFiles};
//     final formData = FormData.fromMap(payload);
//     BusinessService service = BusinessService();
//     try {
//       product.setBusy(true);
//       res = await service.uploadProducts(auth.token, formData,
//           onSendProgress: (a, b) {});
//       product.setBusy(false);
//
//       if (res != null) {
//         if (res.statusCode == 200 && res.data['status'] == 'success') {
//           log(res.data.toString());
//           product.keepUploadedProduct = res.data['data']['fileUrl'];
//
//           if (onSuccessAction != null) {
//             onSuccessAction(); //call this onSuccessAction function
//           }
//         }
//       }
//     } catch (e) {
//       /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
//       null;
//     }
//   }
}
