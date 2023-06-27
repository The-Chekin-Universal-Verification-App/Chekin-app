import 'package:lookapp/core/core.dart';

import '../../utils/helpers/enums.dart';

class AuthProvider extends BaseProvider {
  UserType _accountType = UserType.biz;
  UserType get accountType => _accountType;

  set setAccountType(UserType user) {
    _accountType = user;
    notifyListeners();
  }

  ///the sign up section
  ///begins from here
  // bool authFirstNameIsEmpty = true;
  // bool authLastNameIsEmpty = true;
}
