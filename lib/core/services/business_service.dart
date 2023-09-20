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
      {required String businessId, String nextPage = ''}) async {
    Response? response;
    try {
      response = await get(
          "${R.M.getBusinessReviews(businessId)}$nextPage".trim(),
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
      response =
          await post(R.M.reviewABusiness(businessId), token: token, payload);
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

  Future<Response?> getWishList(String token) async {
    Response? response;
    try {
      response = await get(R.M.getWishList, token: token);

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

  Future<List<dynamic>> addToWishList(String token,
      {required List<String> productId}) async {
    List<dynamic> result;
    try {
      List<Future<dynamic>> futures = [];
      for (var element in productId) {
        futures.add(post(R.M.addToWishList(element), {}, token: token));
      }

      result = await Future.wait(futures);
      // response = await get(R.M.addToWishList(productId), token: token);

      return result;
    } on DioError catch (err) {
      DioExceptions.fromDioError(err).showNotification();
      result = [];

      return result;
    } catch (err) {
      NetworkExceptions.fromNetworkError(err).showNotification();
      result = [];
      return result;
    }
  }

  Future<Response?> removeFromWishList(String token,
      {required String productId}) async {
    Response? res;
    try {
      res = await delete(R.M.addToWishList(productId), {}, token: token);
      return res;
    } on DioError catch (err) {
      DioExceptions.fromDioError(err).showNotification();
      res = null;

      return res;
    } catch (err) {
      NetworkExceptions.fromNetworkError(err).showNotification();
      res = null;
      return res;
    }
  }
}
