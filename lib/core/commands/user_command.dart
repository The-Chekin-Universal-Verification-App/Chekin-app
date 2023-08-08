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
}
