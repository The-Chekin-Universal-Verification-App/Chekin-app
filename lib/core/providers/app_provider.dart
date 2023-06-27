import 'dart:ui';

import 'package:lookapp/export.dart';

import '../../res/language_and_emojis.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppProvider extends BaseProvider {
  ThemeType _theme = ThemeType.light;
  ThemeType get theme => _theme;
  set theme(ThemeType val) {
    _theme = val;
    notifyListeners();
  }

  int get currentPage => _currentPage;
  int _currentPage = 0;
  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  int _onBoardPageIndex = 0;
  int get onBoardPageIndex => _onBoardPageIndex;
  set setOnBoardPageIndex(int val) {
    _onBoardPageIndex = val;
    notifyListeners();
  }

  ////lets get the preferred language of user
  late Language language = Language.languageList().first;

  ///get user preferred language
  Locale get preferredLanguage => Locale(language.languageCode);

  ///get save language saved in  sharedPref
  getUserLanguage() async {
    Map<String, dynamic> languageObject =
        await SharedPrefs.getMap("appLanguage");

    if (languageObject.isNotEmpty) {
      language = Language.fromJson(languageObject); //save language
    } else {
      null; // do nothing
    }
    notifyListeners();
  }

  setLanguage(Language lang) {
    language = lang;
    notifyListeners();
    AppHelper.saveLanguage(language);
  }
}
