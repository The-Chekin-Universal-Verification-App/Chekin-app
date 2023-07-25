import 'package:chekinapp/export.dart';

abstract class BaseService {
  BaseService() {
    _init();
  }

  late final Dio _dio;
  var options = BaseOptions(
    baseUrl: R.N.baseUrl,
    connectTimeout: 5000,
    receiveTimeout: 20000,
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
    },
    contentType: 'application/json',
  );
  HttpClient client = HttpClient();

  _init() {
    _dio = Dio(options);

    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }

  _dioRetry({int? retry}) {
    _dio.interceptors.add(RetryInterceptor(
        dio: _dio,
        logPrint: print,
        retries: retry ?? 3,
        retryDelays: [1.seconds, 2.seconds, 3.seconds]));
  }

  Future<Response> get(String path, {String? token}) async {
    if (token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }
    _dioRetry();
    Response res = await _dio.get(path);
    return res;
  }

  Future<Response> post(String path, Map<String, dynamic> obj,
      {String? token, String? pin, int? retry}) async {
    if (token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
      if (pin != null) {
        _dio.options.headers["pin"] = pin;
      }
      if (retry != null) {
        _dioRetry(retry: retry);
      }
    }

    Response res = await _dio.post(path, data: jsonEncode(obj));
    return res;
  }

  Future<Response> delete() async {
    Response res = await _dio.delete('');
    return res;
  }

  Future<Response> put() async {
    Response res = await _dio.put('');
    return res;
  }

  Future<Response> patch() async {
    Response res = await _dio.patch('');
    return res;
  }
}
