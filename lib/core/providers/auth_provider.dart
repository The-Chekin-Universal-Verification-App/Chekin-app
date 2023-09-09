import '../../export.dart';
import '../models/business_model.dart';
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
    // debugPrint(val);
    _token = val;
    notifyListeners();

    /// set the user token to be used later in the future
    SharedPrefs.setString('token', val);
  }

  //user object
  UserModel _user = UserModel.init();
  UserModel _userCopy = UserModel.init();

  UserModel get user => _user;
  UserModel get userCopy => _userCopy;

  set setUser(Map<String, dynamic> userObject) {
    if (userObject.isEmpty) {
      null;
    } else {
      _user = UserModel.fromJson(userObject);
      _userCopy = _userCopy.copyWith(verified: _user.verified);

      ///this create a copy of user info
      ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..

      ///if the account is a business account execute the code block below
      // execute the below code block if the account is a business account
      if (_user.business.runtimeType != String && _user.business != null) {
        setBusiness = _user.business;
        setAccountType = UserType.biz;
      } else if (_user.business.runtimeType == String &&
          _user.business.isNOtEmpty) {
        //this mean the account is business but we are only get the business id number during get user detail endpoint  which returns only the business ID if the account is a
        //business account
        setAccountType = UserType.biz;
      } else {
        setAccountType = UserType.normal;
      }
    }
    notifyListeners();
  }

  ///get a business information if the account is a business account
  BusinessModel _business = BusinessModel.init();
  BusinessModel get business => _business;
  set setBusiness(Map<String, dynamic> businessObject) {
    if (businessObject.isEmpty) {
      null;
    } else {
      _business = BusinessModel.fromJson(businessObject);
    }
    notifyListeners();
  }

  ///use the copyWith method to persist the data already stored there
  set updateUser(UserModel user) {
    _userCopy = user;
    notifyListeners();
  }

  ///for normal user account
  int _currentNormalUserSignUpIndex = 0;

  int get signUpPageIndex => _currentNormalUserSignUpIndex;

  set setSignUpPageIndex(int value) {
    _currentNormalUserSignUpIndex = value;
    notifyListeners();
  } //

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
    // print('Now working ${model.toJson()}');
    _userSignUpModel = model;
    notifyListeners();

    /// to make this works we would get what is in [userSignUpModel]then do a .copyWith method before calling add to user Info method from the form in the widget try
    ///to maintain consistency
  }

  BusinessSignUpModel _businessSignUpModel = BusinessSignUpModel.init();

  BusinessSignUpModel get businessSignUpModel => _businessSignUpModel;

  set addToBusinessInfo(BusinessSignUpModel model) {
    _businessSignUpModel = model;
    notifyListeners();
    // print('business Now working ${_businessSignUpModel.toJson()}');

    /// to make this works we would get what is in [businessSignUpModel] then do a .copyWith method before calling add to user Info method from the form in the widget try
    ///to maintain consistency
  }

  clearBusinessInfo() {
    _businessSignUpModel = BusinessSignUpModel.init();
    notifyListeners();
  }

  ///section for user log in

  SignInModel _userSignInModel = SignInModel.init();

  SignInModel get userSignInModel => _userSignInModel;

  set addToUserSignInInfo(SignInModel model) {
    // print('Now working ${model.toJson()}');
    _userSignInModel = model;
    notifyListeners();

    /// to make this works we would get what is in [userSignInModel]then do a .copyWith method before calling add to user Info method from the form in the widget try
    ///to maintain consistency
  }
}
