import 'package:chekinapp/core/core.dart';

import '../../utils/helpers/enums.dart';
import '../models/business_signup_model.dart';
import '../models/user_signup_model.dart';

class AuthProvider extends BaseProvider {
  UserType _accountType = UserType.normal;
  UserType get accountType => _accountType;

  set setAccountType(UserType user) {
    _accountType = user;
    notifyListeners();
  }

  ///the user logged in token
  String _token = '';

  String get token => _token;

  set setUserToken(String val) {
    _token = val;
    notifyListeners();
  }

  //user object
  UserModel _user = UserModel.init();

  UserModel get user => _user;

  set setUser(Map<String, dynamic> userObject) {
    if (userObject.isEmpty) {
      null;
    } else {
      _user = UserModel.fromJson(userObject);
    }
    notifyListeners();
  }

  ///for normal user account
  int _currentNormalUserSignUpIndex = 0;

  int get signUpPageIndex => _currentNormalUserSignUpIndex;

  set setSignUpPageIndex(int value) {
    _currentNormalUserSignUpIndex = value;
    notifyListeners();
  }

  ///for business account
  int _currentBusinessSignUpIndex = 0;

  int get businessSignUpPageIndex => _currentBusinessSignUpIndex;

  set setBusinessSignUpPageIndex(int value) {
    _currentBusinessSignUpIndex = value;
    notifyListeners();
  }

  ///the sign up section
  ///begins from here

  UserSignUpModel _userSignUpModel = UserSignUpModel.init();

  UserSignUpModel get userSignUpModel => _userSignUpModel;

  set addToUserInfo(UserSignUpModel model) {
    print('Now working ${model.toJson()}');
    _userSignUpModel = model;
    notifyListeners();

    /// to make this works we would get what is in [userSignUpModel]then do a .copyWith method before calling add to user Info method from the form in the widget try
    ///to maintain consistency
  }

  BusinessSignUpModel _businessSignUpModel = BusinessSignUpModel.init();

  BusinessSignUpModel get businessSignUpModel => _businessSignUpModel;

  set addToBusinessInfo(BusinessSignUpModel model) {
    print('business Now working ${model.toJson()}');

    _businessSignUpModel = model;
    notifyListeners();

    /// to make this works we would get what is in [businessSignUpModel] then do a .copyWith method before calling add to user Info method from the form in the widget try
    ///to maintain consistency
  }
}
