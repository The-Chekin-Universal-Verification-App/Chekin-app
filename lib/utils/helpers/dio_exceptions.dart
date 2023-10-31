import 'package:flutter/cupertino.dart';
import 'package:chekinapp/export.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Action was canceled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout, it could be a network issues";
        break;
      case DioErrorType.receiveTimeout:
        message = "Connection timeout, it could be a network issues";
        break;
      case DioErrorType.response:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioErrorType.sendTimeout:
        message = "Connection timeout, it could be a network issues";
        break;
      case DioErrorType.other:
        if (dioError.message.contains("SocketException")) {
          message = 'No Internet! check your connection';
          break;
        }
        if (dioError.message.contains("is not a subtype of")) {
          message = 'Unable to process the request, probably you can try again';
          break;
        }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Ooh! sorry ${error['message']}';
      case 401:
        return 'Unauthorized ${error['message']}';
      case 403:
        return 'Forbidden';
      case 404:
        return error['message'];
      case 422:
        if (error['data'] != null) {
          return error['data'][0]['description'];

          ///this line of code only works for telneting app so it might break another app remember to comment it out in other project
        } else {
          return error['message'];
        }

      case 500:
        return 'An error occurred';
      case 502:
        return 'An error occurred';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;

  showNotification() {
    BuildContext? context = R.N.nav?.context;
    // DialogServices.showNetworkExceptionModal(context!,
    //     title: "Error",
    //     body: Text(
    //       message,
    //       textAlign: TextAlign.center,
    //       style: TextStyles.h7,
    //     ));

    DialogServices.messageModalFromTop(context!,
        message: message, notificationType: NotificationType.error);
  }
}

class NetworkExceptions implements Exception {
  late String message;

  NetworkExceptions.fromNetworkError(error) {
    if (error is SocketException) {
      message = 'No Internet! check your connection';
    } else if (error is FormatException) {
      message = 'There is an error in the request format';
    } else if (error.toString().contains("is not a subtype of")) {
      message = 'Unable to process the request, probably you can try again';
    } else {
      message = "Un expected error occurred, please contact the admin.";
    }
  }

  @override
  String toString() => message;

  showNotification() {
    BuildContext? context = R.N.nav?.context;
    // DialogServices.showNetworkExceptionModal(context!,
    //     title: "Error",
    //     body: Text(
    //       message,
    //       textAlign: TextAlign.center,
    //       style: TextStyles.h7,
    //     ));

    DialogServices.messageModalFromTop(context!,
        message: message, notificationType: NotificationType.error);
  }
}
