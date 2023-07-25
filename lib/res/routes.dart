import 'package:flutter/material.dart';

class MyRoutes {
  final GlobalKey<NavigatorState> navKey = GlobalKey();
  // final GlobalKey<InAppNotificationState> notifyKey = GlobalKey();

  final String baseUrl = 'https://cheki.onrender.com';

  NavigatorState? get nav => navKey.currentState;
}
