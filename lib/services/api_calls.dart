import 'package:chekin/services/api_service.dart';

class APICalls {
  signupBusiness(data) async {
    var req = await ApiService.postData(data, "auth/signup/business");
    return req;
  }

  signupUser(data) async {
    var req = await ApiService.postData(data, "auth/signup/user");
    return req;
  }

  login(data) async {
    var req = await ApiService.postData(data, "auth/login");
    return req;
  }

  verifyUserEmail(data) async {
    var req = await ApiService.postData(data, "auth/verify-user");
    return req;
  }

  resendOTP(data) async {
    var req = await ApiService.postData(data, "auth/request-verification");
    return req;
  }

  initializePayment(data) async {
    var req = await ApiService.postDataWithToken(data, "payment/initialize");
    return req;
  }

  getLUXCode() async {
    var req = await ApiService.getDataWithToken("business/lux-code");
    return req;
  }

  getUserProfile() async {
    var req = await ApiService.getDataWithToken("user");
    return req;
  }

  getAllBusinesses() async {
    var req = await ApiService.getData("business/?page=1&limit=1&search=lux");
    return req;
  }

  getBusinessReviews(String businessId) async {
    Map req = await ApiService.getDataWithToken("user/reviews/$businessId");
    return req;
  }
}
