import 'package:chekinapp/core/commands/product_command.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/helpers/enums.dart';
import '../providers/auth_provider.dart';
import 'business_command.dart';
import 'commands.dart';

class InitializationCmd extends BaseCommand {
  InitializationCmd(super.c);
  AuthProvider get auth => getProvider();

  Future<void> initUser() async {
    BuildContext context = rootNav!.context;
    BusinessCommand(context).getBusiness(page: '1');
    BusinessCommand(context).getTopRatedBusiness();
    ProductCommand(context).getProducts();
    ProductCommand(context).getCategory();
    ProductCommand(context).getWishList();

    if (auth.accountType == UserType.biz) {
      ProductCommand(context).getMyUploadedProducts();
    }
  }

//
  Future<void> refreshUser() async {
    BuildContext context = rootNav!.context;
    UserCommand(context).getUser(); //
    await BusinessCommand(context).getBusiness(page: '1');
  }
}
