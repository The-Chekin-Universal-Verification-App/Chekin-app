import 'package:lookapp/export.dart';

class ChatProvider extends BaseProvider {
  List<String> _dexterMessages = [];
  List<String> _myMessages = [];

  List<String> get dexterMessages => _dexterMessages;
  List<String> get myMessages => _myMessages;

  set setMyMessages(String msg) {
    _myMessages.add(msg);
    notifyListeners();
  }

  set setDexterMessages(String msg) {
    _dexterMessages.add(msg);
    notifyListeners();
  }
  //
  // String _token = '';
  //
  // String get token => _token;
  // set setUserToken(String val) {
  //   _token = val;
  //   notifyListeners();
  // }
}
