// import 'package:flutter/cupertino.dart';
// import 'package:render_seeker_app/export.dart';
//
// class DioExceptions implements Exception {
//   late String message;
//
//   DioExceptions.fromDioError(DioError dioError) {
//     switch (dioError.type) {
//       case DioErrorType.cancel:
//         message = "Request to server was cancelled";
//         break;
//       case DioErrorType.connectTimeout:
//         message = "Connection timeout with server";
//         break;
//       case DioErrorType.receiveTimeout:
//         message = "Receive timeout in connection with server";
//         break;
//       case DioErrorType.response:
//         message = _handleError(
//           dioError.response?.statusCode,
//           dioError.response?.data,
//         );
//         break;
//       case DioErrorType.sendTimeout:
//         message = "Send timeout in connection with server";
//         break;
//       case DioErrorType.other:
//         if (dioError.message.contains("SocketException")) {
//           message = 'No Internet';
//           break;
//         }
//         message = "Unexpected error occurred";
//         break;
//       default:
//         message = "Something went wrong";
//         break;
//     }
//   }
//
//   String _handleError(int? statusCode, dynamic error) {
//     switch (statusCode) {
//       case 400:
//         return 'Bad request ${error['error']}';
//       case 401:
//         return 'Unauthorized ${error['error']}';
//       case 403:
//         return 'Forbidden';
//       case 404:
//         return error['message'];
//       case 500:
//         return 'Internal server error';
//       case 502:
//         return 'Bad gateway';
//       default:
//         return 'Oops something went wrong';
//     }
//   }
//
//   @override
//   String toString() => message;
//
//   showNotification() {
//     BuildContext? context = R.N.nav?.context;
//
//     context?.showInAppNotification(message);
//   }
// }
