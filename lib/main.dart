import 'package:chekin/routes/app_pages.dart';
import 'package:chekin/utils/colors.dart';
import 'package:chekin/utils/size-config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await dotenv.load();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: kPrimaryColor,
    statusBarBrightness: Brightness.light,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const InitClass());
  });
}

class InitClass extends StatelessWidget {
  const InitClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig().init(constraints);
      return GetMaterialApp(
        title: "Chekin",
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.SPLASHSCREEN ,
        getPages: AppPages.routes,
        //theme: ThemeData(fontFamily: 'Lufga-Regular'),
      );
    });
  }
}
