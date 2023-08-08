import 'package:chekinapp/core/models/business_model.dart';
import 'package:chekinapp/export.dart';

import '../providers/business_provider.dart';
import '../services/business_service.dart';

class BusinessCommand extends BaseCommand {
  BusinessCommand(super.c);
  AuthProvider get auth => getProvider();
  BusinessProvider get business => getProvider();

  Future<void> getBusiness(
      {String page = '1', String limit = '1', String search = 'lux'}) async {
    Response? res;

    BusinessService service = BusinessService();
    String path = _getPath(page: page, limit: limit, search: search);
    try {
      res = await service.getBusiness(auth.token, urlPath: path);
      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          business.setBusiness = res.data['data']['data'];
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  String _getPath({String page = '1', String limit = '', String search = ''}) {
    String searchKey = "?page=$page&limit=$limit&search=$search";

    if (limit == '') {
      searchKey = "?page=$page&search=$search";
    } else if (limit == '') {
      searchKey = "?page=$page&search=$search";
    } else {
      searchKey = "?page=$page&limit=$limit&search=$search";
    }
    return searchKey;
  }

  Future<void> getLuxCode() async {
    Response? res;

    BusinessService service = BusinessService();
    try {
      res = await service.getLuxCode(auth.token);
      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          var code = res.data['data']['data'];
          // debugPrint(code);
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  Future<void> updateBusiness(BusinessModel business) async {}
}
