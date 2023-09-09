import '../../export.dart';

class PaymentService extends BaseService {
  Future<Response?> initPayment(String token,
      {required Map<String, dynamic> payload}) async {
    Response? response;
    // print(urlPath);
    try {
      // print(R.M.getBusiness + urlPath);
      response = await post(
        R.M.initPayment,
        payload,
        token: token,
      );

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
