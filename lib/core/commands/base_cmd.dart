import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

abstract class BaseCommand {
  static BuildContext? _lastKnownRoot;
  BuildContext? context;
  NavigatorState? get rootNav => R.N.nav;

  BaseCommand(BuildContext c) {
    context = (rootNav!.context == _lastKnownRoot)
        ? R.N.nav!.context
        : Provider.of(rootNav!.context, listen: false);
    _lastKnownRoot = context;
  }

  T getProvider<T>() => Provider.of<T>(context!, listen: false);
}
