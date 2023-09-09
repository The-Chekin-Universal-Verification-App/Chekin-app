// ignore_for_file: use_build_context_synchronously

import 'package:chekinapp/core/models/user_signup_model.dart';
import 'package:chekinapp/routes/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';
import '../../routes/auth/normal_user_biz_account_registration/reset_password_screen.dart';
import '../../routes/auth/normal_user_biz_account_registration/biz_account/you_are_almost_done_screen.dart';
import '../../routes/auth/normal_user_biz_account_registration/email_verification.dart';
import '../../routes/main/mainscreen.dart';
import '../models/reset_password_model.dart';
import 'initialization_cmd.dart';

class AuthCommand extends BaseCommand {
  AuthCommand(super.c);

  AuthProvider get auth => getProvider();

  Future<void> normalUserSignUp(UserSignUpModel model) async {
    BuildContext context = rootNav!.context;
    Response? res;

    AuthService service = AuthService();
    try {
      res = await service.normalUserSignUp(model.toJson());
      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          context.push(EmailVerificationScreen(
            email: model.email,
          ));

          Future.delayed(const Duration(seconds: 2), () {
            DialogServices.messageModalFromTop(context,
                message: res?.data['message']);
          });
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  Future<void> bizAccountSignUp(BusinessSignUpModel model) async {
    BuildContext context = rootNav!.context;
    Response? res;

    AuthService service = AuthService();
    try {
      res = await service.bizAccountSignUp(model.toJson());
      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          context.push(EmailVerificationScreen(
            email: model.email,
          ));
          Future.delayed(const Duration(seconds: 2), () {
            DialogServices.messageModalFromTop(context,
                message: res?.data['message']);
          });
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  Future<void> signIn(SignInModel model,
      {bool routeToMainOnSuccess = true}) async {
    BuildContext context = rootNav!.context;
    Response? res;

    AuthService service = AuthService();
    try {
      res = await service.signIn(model.toJson());
      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          auth.setUserToken = res.data['data']['token'];
          auth.setUser = res.data['data']['user'];

          log(res.data.toString());

          InitializationCmd(context).initUser();
          if (routeToMainOnSuccess == true) {
            context.push(const MainScreen());
          } else {
            null;
          }
        } else if (res.statusCode == 401 &&
            res.data['message'].toString().toLowerCase() ==
                "User is not verified".toLowerCase()) {
          ///navigate to email verification screen
          context.push(EmailVerificationScreen(email: model.email));

          ///tell user his email has not been verified
          DialogServices.messageModalFromTop(context,
              message: res.data['message'],
              notificationType: NotificationType.error);
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  Future<void> verifyEmail(EmailVerificationModel model) async {
    BuildContext context = rootNav!.context;
    Response? res;

    AuthService service = AuthService();
    try {
      res = await service.verifyMail(model.toJson());
      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          auth.setUserToken = res.data['data']['token'];
          await UserCommand(context).getUser();
          if (auth.accountType == UserType.normal) {
            context.push(const SuccessRegistrationScreen());
          } else {
            // this happens when user create a business account

            SignInModel model = SignInModel(
                password: auth.businessSignUpModel.password,
                email: auth.businessSignUpModel.email);

            ///next
            //lets log in user to get access token
            signIn(model, routeToMainOnSuccess: false);
            context.push(const YouAreAlmostDoneScreen());
          }
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  Future<void> resendVerificationOTP(String email) async {
    BuildContext context = rootNav!.context;

    Response? res;

    AuthService service = AuthService();
    try {
      res = await service.resendSendVerificationOTP({'email': email});
      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          DialogServices.messageModalFromTop(context,
              message: res.data['message'],
              notificationType: NotificationType.success);
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  Future<void> forgotPassword(EmailVerificationModel model) async {
    BuildContext context = rootNav!.context;
    Response? res;

    AuthService service = AuthService();
    try {
      res = await service.forgotPassword(model.toJson());
      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          context.push(ResetPasswordScreen(
            email: model.email,
          ));

          DialogServices.messageModalFromTop(context,
              message: res.data['message'],
              notificationType: NotificationType.success);
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  Future<void> resendForgotPassword(EmailVerificationModel model) async {
    BuildContext context = rootNav!.context;
    Response? res;

    AuthService service = AuthService();
    try {
      res = await service.forgotPassword(model.toJson());
      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          DialogServices.messageModalFromTop(context,
              message: res.data['message'],
              notificationType: NotificationType.success);
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  Future<void> resetPassword(ResetPasswordModel model) async {
    BuildContext context = rootNav!.context;
    Response? res;

    AuthService service = AuthService();
    try {
      res = await service.resetPassword(model.toJson());
      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          context.push(const LogInScreen());
          Future.delayed(const Duration(seconds: 2), () {
            DialogServices.messageModalFromTop(context,
                message: res?.data['message'],
                notificationType: NotificationType.success);
          });
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  Future<void> changePassword(Map<String, dynamic> json) async {
    BuildContext context = rootNav!.context;
    Response? res;

    AuthService service = AuthService();
    try {
      res = await service.changePassword(json, token: auth.token);
      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          context.push(const MainScreen());
          Future.delayed(const Duration(seconds: 2), () {
            DialogServices.messageModalFromTop(context,
                message: res?.data['message'],
                notificationType: NotificationType.success);
          });
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }
}
