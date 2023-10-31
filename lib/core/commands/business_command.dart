// ignore_for_file: use_build_context_synchronously

import 'package:chekinapp/core/commands/initialization_cmd.dart';
import 'package:chekinapp/export.dart';
import 'package:flutter/cupertino.dart';

import '../../routes/auth/normal_user_biz_account_registration/biz_account/incomplete_account_kyc_notifier.dart';
import '../../utils/imagepicker/provider/image_provider.dart';
import '../models/business_model.dart';
import '../providers/business_provider.dart';
import '../services/business_service.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';

class BusinessCommand extends BaseCommand {
  BusinessCommand(super.c);
  AuthProvider get auth => getProvider();
  BusinessProvider get business => getProvider();
  ImageProviders get image => getProvider();

  Future<void> getBusiness(
      {String page = '1', String limit = '10', String search = ''}) async {
    Response? res;

    BusinessService service = BusinessService();
    String path = _getPath(page: page, limit: limit, search: search);
    try {
      business.setBusy(true);
      res = await service.getBusiness(auth.token, urlPath: path);
      business.setBusy(false);

      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          business.setBusiness(res.data['data']['data'],
              totalPage: res.data['data']['totalPages'],
              currentPage: res.data['data']['currentPage'],
              pageLimit: int.parse(limit));
        }
      }
    } catch (e) {
      business.setBusy(false);

      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  Future<void> getTopRatedBusiness() async {
    Response? res;

    BusinessService service = BusinessService();
    try {
      // business.setBusy(true);
      res = await service.getTopRatedBusiness(
        auth.token,
      );
      // business.setBusy(false);

      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          business.setTopRatedBusiness(
            res.data['data'],
          );
        }
      }
    } catch (e) {
      business.setBusy(false);

      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  ///get business by ID
  Future<void> getBusinessByID({required String bizID}) async {
    Response? res;

    BusinessService service = BusinessService();

    try {
      res = await service.getBusinessByID(
        auth.token,
        bizID: bizID,
      );
      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          business.setSingleBusiness(
            res.data['data']['data'],
          );
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  ///get check why a user is not yet verified if he has not fully uploaded his required document
  Future<void> confirmBusinessDocumentUpload({required String bizID}) async {
    BuildContext context = rootNav!.context;
    Response? res;

    BusinessService service = BusinessService();

    try {
      res = await service.confirmBusinessDocUpload(
        auth.token,
        bizID: bizID,
      );
      if (res != null) {
        // print('working status check>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
        log(res.data.toString());
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          BusinessDocUploadModel bizStatus =
              BusinessDocUploadModel.fromJson(res.data['data']);
          if (res.data['data']['idUpload'] == false ||
              res.data['data']['utility'] == false ||
              res.data['data']['instagramWhenLoggedIn'] == false ||
              res.data['data']['facebookWhenLoggedIn'] == false ||
              res.data['data']['selfieHoldingId'] == false) {
            context.push(IncompleteAccountKYCNotifier(bizStatus: bizStatus));
          } else {
            // context.push(IncompleteAccountKYCNotifier(
            //   bizStatus: bizStatus,
            // ));
          }
        }
      }
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

  Future<void> getLuxCode() async {
    Response? res;

    BusinessService service = BusinessService();
    try {
      res = await service.getLuxCode(auth.token);
      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          var code = res.data['data']['data'];
          // debugPrint(code);
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  ///this is use to upload a single image
  Future<void> updateBusinessDocument(
      String fieldName, String imagePath) async {
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
        fieldName: await MultipartFile.fromFile(imagePath.trim(),
            filename: fileName, contentType: MediaType(mimee!, type!))
      };
      //Add to change profile image if only it's not an empty string
      // print(imagePath);
    }

    final formData = FormData.fromMap(payload);
    BusinessService service = BusinessService();
    try {
      //
      business.isBusy = true;

      res = await service.updateBusinessDocument(auth.token, formData,
          onSendProgress: (totalLoad, progress) {
        business.setUploadProgress(totalLoad: totalLoad, progress: progress);
      });
      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          auth.setBusiness = res.data['data'];
          business.uploadSuccess = UploadStatus.completed;
          image.clearSingleImagePath();
          DialogServices.messageModalFromTop(
            context,
            message: res.data['message'],
          );
          // getUser();
        }
      } else {
        // business.resetUploadProgress();
        business.uploadSuccess = UploadStatus.failed;
      }
      business.isBusy = false;
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
      business.isBusy = false;
      business.resetUploadProgress();
      business.uploadSuccess = UploadStatus.failed;
    }
  }

  ///only use text update does not include file or image
  Future<void> updateBusiness(BusinessSignUpModel model) async {
    BuildContext context = rootNav!.context;
    Response? res;
    Map<String, dynamic> payload = model.toJson();
    payload.removeWhere((key, value) =>
        value == '' ||
        value == null); // remove all empty String and null map value
    BusinessService service = BusinessService();
    try {
      final formData = FormData.fromMap(payload); //convert to FormData

      res = await service.updateBusinessProfile(auth.token, formData);
      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          //
          Navigator.of(context)
              .pop(); //pop off the screen back to the main edit business profile screen

          Future.delayed(const Duration(seconds: 2), () {
            DialogServices.messageModalFromTop(context,
                message: res?.data['message']);
          });
          auth.clearBusinessInfo();
          InitializationCmd(context).refreshUser();
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  ///make review on a business
  Future<void> reviewBusiness(
      {required String businessId,
      required MakeBusinessReviewModel model}) async {
    BuildContext context = rootNav!.context;
    Response? res;

    BusinessService service = BusinessService();

    try {
      res = await service.reviewABusiness(auth.token, model.toJson(),
          businessId: businessId);
      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          Navigator.of(context).pop();
          DialogServices.messageModalFromTop(context,
              message: 'Reviews submitted Successfully!');
          getBusinessReviews(businessId: businessId);
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  ///make review on a business
  Future<void> getBusinessReviews(
      {required String businessId, bool gotoNextPageIfAny = false}) async {
    BuildContext context = rootNav!.context;
    Response? res;

    BusinessService service = BusinessService();

    //this logic block next the page for more reviews data
    int? nextPage;
    if (business.currentReviewPage < business.totalReviewPage &&
        gotoNextPageIfAny == true) {
      nextPage = business.currentReviewPage + 1;
    } else {
      null;
    }
    try {
      res = await service.getBusinessReview(auth.token,
          businessId: businessId,
          nextPage: nextPage != null ? nextPage.toString() : '');
      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          log(res.data.toString());
          business.setBusinessReviews(res.data['data']['data'],
              totalPage: res.data['data']['totalPages'],
              currentPage: res.data['data']['currentPage']);
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }
}
