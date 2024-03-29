import 'package:chekinapp/export.dart';

class UserService extends BaseService {
  Future<Response?> getUser(String token) async {
    Response? response;
    try {
      response = await get(R.M.getUser, token: token);
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

  Future<Response?> updateUserProfile(String token, FormData payload) async {
    Response? response;

    try {
      response = await put(R.M.updateProfile, token: token, data: payload);
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
