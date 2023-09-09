// ignore_for_file: use_build_context_synchronously

import 'package:chekinapp/main.dart';
import 'package:flutter/cupertino.dart';

import '../../export.dart';

class UserCommand extends BaseCommand {
  UserCommand(super.c);
  AuthProvider get auth => getProvider();
  Future<void> getUser() async {
    Response? res;

    UserService service = UserService();
    try {
      res = await service.getUser(auth.token);
      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          auth.setUser = res.data['data'];
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }

  Future<void> updateUserProfile(UserModel model, String imagePath) async {
    BuildContext context = rootNav!.context;
    Response? res;
    Map<String, dynamic> payload = model.toJson();
    payload.removeWhere((key, value) =>
        value == '' ||
        value == null); // remove all empty String and null map value

    if (imagePath != '') {
      payload['profileImage'] = await MultipartFile.fromFile(imagePath);
      //Add to change profile image if only it's not an empty string
    }

    UserService service = UserService();
    try {
      final formData = FormData.fromMap(payload); // convert to formData
      res = await service.updateUserProfile(auth.token, formData);
      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          auth.setUser = res.data['data'];
          DialogServices.messageModalFromTop(
            context,
            message: res.data['message'],
          );
          getUser();
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }
}
