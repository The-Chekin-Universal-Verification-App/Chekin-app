// ignore_for_file: use_build_context_synchronously

import 'package:chekinapp/core/models/user_signup_model.dart';
import 'package:flutter/material.dart';

import '../../export.dart';
import '../services/sign_up_service.dart';

class SignUpCommand extends BaseCommand {
  SignUpCommand(super.c);

  Future<void> normalUserSignUp(UserSignUpModel model) async {
    BuildContext context = rootNav!.context;
    Response? res;

    SignUpService service = SignUpService();
    try {
      res = await service.normalUserSignUp(model.toJson());
      if (res != null) {
        if (res.statusCode == 200 && res.data['status'] == "success") {
          DialogServices.messageModalFromTop(context,
              message: res.data['message']);
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }
}
