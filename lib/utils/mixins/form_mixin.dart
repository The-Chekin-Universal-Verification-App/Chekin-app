import 'dart:async';
import 'package:flutter/material.dart';

mixin FormMixin<T extends StatefulWidget> on State<T> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode? autoValidateMode;

  bool _validForm = false;
  bool get isFormValid => _validForm;

  void validate(VoidCallback callback,
      {VoidCallback? orElse, bool shouldUnFocus = true}) {
    final FormState? formState = formKey.currentState;

    if (formState != null && formState.validate() != false) {
      shouldUnFocus ? FocusScope.of(context).unfocus() : null;
      formState.save();
      _validForm = true;
      callback();
    } else {
      _validForm = false;
      setState(() => autoValidateMode = AutovalidateMode.onUserInteraction);

      orElse?.call();
    }
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool isLoading) {
    if (!mounted) return;
    setState(() => _isLoading = isLoading);
  }

  FutureOr load<R>(Future<R> Function() action) async {
    isLoading = true;
    R result = await action();
    isLoading = false;
    return result;
  }
}

///hello world
