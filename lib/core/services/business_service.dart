import 'package:chekinapp/export.dart';

class BusinessService extends BaseService {
  Future<Response?> getBusiness(String token, {required String urlPath}) async {
    Response? response;
    // print(urlPath);
    try {
      // print(R.M.getBusiness + urlPath);
      response = await get(R.M.getBusiness + urlPath, token: token);

      return response;
    } on DioError catch (err) {
      DioExceptions.fromDioError(err).showNotification();
      response = null;

      return response;
    } catch (err) {
      NetworkExceptions.fromNetworkError(err).showNotification();
      response = null;
      return response;
    }
  }

  Future<Response?> getBusinessByID(String token,
      {required String bizID}) async {
    Response? response;
    // print(urlPath);
    try {
      response = await get(R.M.getBusinessByID(bizID), token: token);

      return response;
    } on DioError catch (err) {
      DioExceptions.fromDioError(err).showNotification();
      response = null;

      return response;
    } catch (err) {
      NetworkExceptions.fromNetworkError(err).showNotification();
      response = null;
      return response;
    }
  }

  Future<Response?> getLuxCode(String token) async {
    Response? response;
    try {
      response = await get(R.M.getLex, token: token);

      return response;
    } on DioError catch (err) {
      DioExceptions.fromDioError(err).showNotification();
      response = null;

      return response;
    } catch (err) {
      NetworkExceptions.fromNetworkError(err).showNotification();
      response = null;
      return response;
    }
  }

  Future<Response?> updateBusinessDocument(String token, FormData payload,
      {Function(int totalLoad, int currentLoad)? onSendProgress}) async {
    Response? response;

    try {
      response = await put(R.M.updateBusiness,
          token: token,
          data: payload,
          isImageFile: true,
          onSendProgress: onSendProgress);
      return response;
    } on DioError catch (err) {
      DioExceptions.fromDioError(err).showNotification();
      response = null;

      return response;
    } catch (err) {
      NetworkExceptions.fromNetworkError(err).showNotification();
      response = null;
      return response;
    }
  }

  Future<Response?> updateBusinessProfile(
      String token, FormData payload) async {
    Response? response;

    try {
      response = await put(R.M.updateBusiness, token: token, data: payload);
      return response;
    } on DioError catch (err) {
      DioExceptions.fromDioError(err).showNotification();
      response = null;

      return response;
    } catch (err) {
      NetworkExceptions.fromNetworkError(err).showNotification();
      response = null;
      return response;
    }
  }

  Future<Response?> getBusinessReview(String token,
      {required String businessId, String? nextPage}) async {
    Response? response;
    try {
      response = await get("${R.M.getBusinessReviews(businessId)}$nextPage",
          token: token);

      return response;
    } on DioError catch (err) {
      DioExceptions.fromDioError(err).showNotification();
      response = null;

      return response;
    } catch (err) {
      NetworkExceptions.fromNetworkError(err).showNotification();
      response = null;
      return response;
    }
  }

  Future<Response?> reviewABusiness(String token, Map<String, dynamic> payload,
      {required String businessId}) async {
    Response? response;

    try {
      response = await put(R.M.reviewABusiness(businessId),
          token: token, data: payload);
      return response;
    } on DioError catch (err) {
      DioExceptions.fromDioError(err).showNotification();
      response = null;

      return response;
    } catch (err) {
      NetworkExceptions.fromNetworkError(err).showNotification();
      response = null;
      return response;
    }
  }

  Future<Response?> getProducts(String token, {required String urlPath}) async {
    Response? response;
    // print(urlPath);
    try {
      response = await get(R.M.getProducts, token: token);

      return response;
    } on DioError catch (err) {
      DioExceptions.fromDioError(err).showNotification();
      response = null;

      return response;
    } catch (err) {
      NetworkExceptions.fromNetworkError(err).showNotification();
      response = null;
      return response;
    }
  }
}
