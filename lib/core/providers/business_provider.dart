import 'package:chekinapp/core/core.dart';
import 'package:chekinapp/core/models/business_model.dart';

class BusinessProvider extends BaseProvider {
  BusinessModel _business = BusinessModel.init();
  List _searchedBusiness = [];

  setBusiness(List businessListJson, {int currentPage = 1, int limit = 10}) {
    _searchedBusiness = businessListJson;
    notifyListeners();
  }

  BusinessModel get business => _business;

  //try and get business and do a copyWith method to edit business info then call the below update method
  //so the info can be passed to the update business Api for business update
  set updateBusinessDetail(BusinessModel business) {
    _business = business;
    notifyListeners();
  }
}
