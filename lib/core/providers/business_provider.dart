import 'package:chekinapp/core/core.dart';
import 'package:chekinapp/core/models/business_model.dart';

import '../models/business_review_model.dart';

class BusinessProvider extends BaseProvider {
  BusinessModel _myBusinessDetail = BusinessModel.init();

  ///the above lines works only if the account is a business account
  List<BusinessModel> _searchedBusiness = [];
  int _totalPage = 0;
  int _currentPage = 1;

  bool _isLastPage = false;
  bool _reachedEndOfCurrentPage = false;

  bool get isLastPage => _isLastPage;
  bool get hasReachedEndOfCurrentPage => _reachedEndOfCurrentPage;
  List<BusinessModel> get allAvailableBusiness => _searchedBusiness;

  ///
  ///
  ///
  ///
  List<BusinessModel> _topRated = [];
  List<BusinessModel> _popular = [];

  List<BusinessModel> get topRated => _searchedBusiness; //_topRated;
  List<BusinessModel> get popular => _searchedBusiness; // _popular;

  ///
  setBusiness(List businessListJson,
      {int currentPage = 1, int totalPage = 10, required int pageLimit}) {
    isBusy = true;
    //
    List<BusinessModel> listOfBusiness =
        businessListJson.map((e) => BusinessModel.fromJson(e)).toList();
    //
    _searchedBusiness.addAll(listOfBusiness);
    _totalPage = totalPage;
    _currentPage = currentPage;
    _isLastPage = _currentPage == _totalPage ? true : false;

    //if what we are receiving is less than our page limit then we have reached the end of current page we need to move to next page if there is another page
    _reachedEndOfCurrentPage = listOfBusiness.length < pageLimit ? true : false;
    // print(_searchedBusiness);
    isBusy = false;
    notifyListeners();
  }

  BusinessModel get myBusinessDetail => _myBusinessDetail;

  //try and get business and do a copyWith method to edit business info then call the below update method
  //so the info can be passed to the update business Api for business update
  set updateBusinessDetail(BusinessModel business) {
    _myBusinessDetail = business;
    notifyListeners();
  }

  double _uploadProgress = 0;
  double get uploadProgress => _uploadProgress;

  setUploadProgress({required int totalLoad, required int progress}) {
    _uploadProgress =
        totalLoad / progress; //this will give the rate in percentage
    notifyListeners();
    uploadSuccess = UploadStatus.inProgress;
  }

  resetUploadProgress() {
    _uploadProgress = 0;
    uploadSuccess = UploadStatus.wait;

    notifyListeners();
  }

  UploadStatus _uploadStatus = UploadStatus.wait;
  UploadStatus get uploadStatus => _uploadStatus;

  set uploadSuccess(UploadStatus val) {
    _uploadStatus = val;
    notifyListeners();
  }

  ///fetch a single business by ID
  ///
  BusinessModel _fetchedSingleBusiness = BusinessModel.init();
  BusinessModel get fetchedSingleBusiness => _fetchedSingleBusiness;

  setSingleBusiness(Map<String, dynamic> object) {
    _fetchedSingleBusiness = BusinessModel.fromJson(object);
    notifyListeners();
  }

  //clear what ever is in the business field
  clearSingleBusiness() {
    _fetchedSingleBusiness = BusinessModel.init();
    notifyListeners();
  }

  List<BusinessReviewModel> _reviews = [];
  int _totalReviewPage = 0;
  int _currentReviewPage = 1;
  List<BusinessReviewModel> get reviews => _reviews;
  int get currentReviewPage => _currentReviewPage;
  int get totalReviewPage => _totalReviewPage;
  setBusinessReviews(List businessReviewsListJson,
      {int currentPage = 1, int totalPage = 10}) {
    isBusy = true;
    //
    List<BusinessReviewModel> listOfBusinessReviews = businessReviewsListJson
        .map((e) => BusinessReviewModel.fromJson(e))
        .toList();
    //
    _reviews.addAll(listOfBusinessReviews);
    _totalReviewPage = totalPage;
    _currentReviewPage = currentPage;
    isBusy = false;
    notifyListeners();
  }

  ///pick a business to be viewed in business detail
  ///
  BusinessModel _selectedBusiness = BusinessModel.init();

  BusinessModel get selectedBusiness => _selectedBusiness;

  set selectABusiness(BusinessModel business) {
    _selectedBusiness = business;
    notifyListeners();
  }
}

enum UploadStatus { completed, failed, pending, wait, inProgress }
