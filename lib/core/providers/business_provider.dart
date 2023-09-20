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

//
  //clear what ever is in the business field
  clearSingleBusiness() {
    _fetchedSingleBusiness = BusinessModel.init();
    notifyListeners();
  }

  String _topTenRating = '';
  String get topTenRating => _topTenRating;
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
    if (_currentReviewPage != currentPage || _totalReviewPage != totalPage) {
      //
      _reviews.addAll(listOfBusinessReviews);
      _totalReviewPage = totalPage;
      _currentReviewPage = currentPage;
      _topTenRating = TopTenRating().getTopTenRatings(reviews);
    } else if (_currentReviewPage == currentPage ||
        _totalReviewPage == totalPage &&
            businessReviewsListJson.length > _reviews.length) {
      ///in the case where it is in the same page and the following condition is true
      _reviews = listOfBusinessReviews;
      //just insert what ever that is coming from server into the list holding reviews
    }

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

class TopTenRating {
  int one = 0;
  int two = 0;
  int three = 0;
  int four = 0;
  int five = 0;

  List<String> topTenRatings = [];

  String getTopTenRatings(List<BusinessReviewModel> reviews) {
    topTenRatings = [];
    if (reviews.isNotEmpty && reviews.length <= 10) {
      for (var element in reviews) {
        topTenRatings.add(element.rating.toString());
      }
    }
    return returnHighestRating();
  }

  String returnHighestRating() {
    sortHighest();
    if (one > two && one > three && one > four && one > five) {
      return '1';
    } else if (two > one && two > three && two > four && two > five) {
      return '2';
    } else if (three > one && three > two && three > four && three > five) {
      return '3';
    } else if (four > one && four > two && four > three && four > five) {
      return '4';
    } else if (five > one && five > two && five > three && five > four) {
      return '5';
    } else {
      return '';
    }
  }

  sortHighest() {
    for (String e in topTenRatings) {
      if (e == '1') {
        one = one + 1;
      } else if (e == '2') {
        two = two + 1;
      } else if (e == '3') {
        three = three + 1;
      } else if (e == '4') {
        four = four + 1;
      } else if (e == '5') {
        five = five + 1;
      }
    }
  }
}
