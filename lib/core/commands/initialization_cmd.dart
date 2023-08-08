import 'package:flutter/cupertino.dart';

import '../providers/auth_provider.dart';
import 'business_command.dart';
import 'commands.dart';

class InitializationCmd extends BaseCommand {
  InitializationCmd(super.c);
  AuthProvider get auth => getProvider();

  Future<void> initUser() async {
    BuildContext context = rootNav!.context;
    UserCommand(context).getUser();
    BusinessCommand(context).getBusiness(page: '1');
  }

//
  Future<void> refreshUser() async {
    BuildContext context = rootNav!.context;
  }
}
