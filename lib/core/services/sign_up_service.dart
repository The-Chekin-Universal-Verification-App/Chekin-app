import 'package:chekinapp/export.dart';

class SignUpService extends BaseService {
  Future<Response?> normalUserSignUp(Map<String, dynamic> payload) async {
    payload.removeWhere((key, value) => value == null || value == '');

    Response? response;
    try {
      response = await post(R.M.signUp, payload);
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
