import 'package:chekinapp/export.dart';

class BusinessService extends BaseService {
  Future<Response?> getBusiness(String token, {required String urlPath}) async {
    Response? response;
    print(urlPath);
    try {
      print(R.M.getBusiness + urlPath);
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
}
