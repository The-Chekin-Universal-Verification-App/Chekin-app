import 'package:chekinapp/export.dart';

class AuthService extends BaseService {
  Future<Response?> normalUserSignUp(Map<String, dynamic> payload) async {
    payload.removeWhere((key, value) => value == null || value == '');

    Response? response;
    try {
      response = await post(R.M.signUp, payload, retry: 3);
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

  Future<Response?> bizAccountSignUp(Map<String, dynamic> payload) async {
    payload.removeWhere((key, value) => value == null || value == '');

    Response? response;
    try {
      response = await post(R.M.signUpBiz, payload, retry: 3);
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

  Future<Response?> signIn(Map<String, dynamic> payload) async {
    payload.removeWhere((key, value) => value == null || value == '');

    Response? response;
    try {
      response = await post(R.M.logIn, payload, retry: 3);
      return response;
    } on DioError catch (err) {
      if (err.type == DioErrorType.response &&
          err.response?.statusCode == 401) {
        response = err.response;
      } else {
        DioExceptions.fromDioError(err).showNotification();
        response = null;
      }

      return response;
    } catch (err) {
      NetworkExceptions.fromNetworkError(err).showNotification();
      response = null;
      return response;
    }
  }

  Future<Response?> verifyMail(Map<String, dynamic> payload) async {
    payload.removeWhere((key, value) => value == null || value == '');

    Response? response;
    try {
      response = await post(R.M.verifyMail, payload);
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

  Future<Response?> forgotPassword(Map<String, dynamic> payload) async {
    payload.removeWhere((key, value) => value == null || value == '');

    Response? response;
    try {
      response = await post(R.M.forgotPassword, payload);
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

  Future<Response?> resetPassword(Map<String, dynamic> payload) async {
    payload.removeWhere((key, value) => value == null || value == '');

    Response? response;
    try {
      response = await post(R.M.resetPassword, payload);
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

  Future<Response?> changePassword(Map<String, dynamic> payload,
      {required String token}) async {
    payload.removeWhere((key, value) => value == null || value == '');

    Response? response;
    try {
      response = await patch(R.M.changePassword, payload, token: token);
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

  Future<Response?> resendSendVerificationOTP(
      Map<String, dynamic> payload) async {
    payload.removeWhere((key, value) => value == null || value == '');

    Response? response;
    try {
      response = await post(R.M.resendOTP, payload);
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
