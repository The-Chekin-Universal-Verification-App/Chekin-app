import 'package:chekinapp/export.dart';

abstract class BaseService {
  BaseService() {
    _init();
  }

  late final Dio _dio;
  var options = BaseOptions(
    baseUrl: R.N.baseUrl,
    connectTimeout: 60000,
    receiveTimeout: 60000,
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
    }
    if (retry != null) {
      _dioRetry(retry: retry);
    }
    Response res = await _dio.post(path, data: jsonEncode(obj));
    return res;
  }

  Future<Response> delete(String path, Map<String, dynamic> obj,
      {String? token, String? pin, int? retry}) async {
    if (token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
      if (pin != null) {
        _dio.options.headers["pin"] = pin;
      }
    }
    if (retry != null) {
      _dioRetry(retry: retry);
    }
    Response res = await _dio.delete(path, data: jsonEncode(obj));
    return res;
  }

  Future<Response> put(String path,
      {required dynamic data,
      String? token,
      int? retry,
      bool isImageFile = false,
      Function(int totalLoad, int currentLoad)? onSendProgress}) async {
    if (token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";

      if (retry != null) {
        _dioRetry(retry: retry);
      }
    }
    if (isImageFile) {
      _dio.options.headers["Content-Type"] = "multipart/form-data";
    }
    Response res =
        await _dio.put(path, data: data, onSendProgress: onSendProgress);
    return res;
  }


  Future<Response> patch(String path, Map<String, dynamic> obj,
      {String? token, String? pin, int? retry}) async {
    if (token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
      if (pin != null) {
        _dio.options.headers["pin"] = pin;
      }
    }
    if (retry != null) {
      _dioRetry(retry: retry);
    }
    Response res = await _dio.patch(path, data: jsonEncode(obj));
    return res;
  }

  Future<Response> postImage(String path,
      {required dynamic data,
      String? token,
      int? retry,
      Function(int totalLoad, int currentLoad)? onSendProgress}) async {
    if (token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }
    if (retry != null) {
      _dioRetry(retry: retry);
    }
    _dio.options.headers["Content-Type"] = "multipart/form-data";

    Response res =
        await _dio.post(path, data: data, onSendProgress: onSendProgress);
    return res;
  }
}
