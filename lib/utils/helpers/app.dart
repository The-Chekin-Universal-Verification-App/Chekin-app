import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:chekinapp/export.dart';
import 'dart:math' as math;

import '../../res/language_and_emojis.dart';

class AppHelper {
  static void getFutureSizeFromGlobalKey(
      GlobalKey key, Function(Size size) callback) {
    Future.microtask(() {
      Size? size = getSizeFromContext(key.currentContext);
      if (size != null) {
        callback(size);
      }
    });
  }

  static Size? getSizeFromContext(BuildContext? context) {
    RenderBox rb = context?.findRenderObject() as RenderBox;
    return rb.size;
  }

  static Offset getOffsetFromContext(BuildContext? context, [Offset? offset]) {
    RenderBox rb = context?.findRenderObject() as RenderBox;
    return rb.localToGlobal(offset ?? Offset.zero);
  }

  static void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static bool get isMouseConnected =>
      RendererBinding.instance.mouseTracker.mouseIsConnected;

  static void unFocus() {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
  }

  static String getDevice() {
    if (Platform.isAndroid) {
      return "mobile";
    } else if (Platform.isMacOS) {
      return "laptop";
    } else if (Platform.isFuchsia) {
      return "mobile";
    } else if (Platform.isLinux) {
      return "laptop";
    } else if (Platform.isWindows) {
      return "laptop";
    } else {
      return "laptop";
    }
  }

  //lets save the language
  static saveLanguage(Language appLanguage) {
    Language language = appLanguage;

    ///
    SharedPrefs.setMap('appLanguage', language.toMap());
  }
}

safePrint(Object? object) {
  if (kDebugMode) {
    print(object);
  }
}

// /// get a unique random string id at call
// String getRandomUID() {
//   var uuid = const Uuid();
//   return uuid.v4();
// }
