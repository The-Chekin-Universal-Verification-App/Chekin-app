import 'package:chekin/screen/app/user/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:chekin/constants/assets_path.dart';
import 'package:chekin/shared/custom_text.dart';
import 'package:chekin/utils/colors.dart';
import 'package:chekin/utils/sizes.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: LayoutBuilder(
            builder: ((context, constraints) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(18),
                    color: kPrimaryColor,
                    height: heightSize(119),
                    width: constraints.maxWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: heightSize(31)),
                        const CustomAppBar()
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: heightSize(69)),
                          item(
                            title: "Change Password",
                            callback: () {},
                          ),
                          item(
                            title: "Manage Notifications",
                            callback: () {},
                          ),
                          item(
                            title: "Check LUX Code",
                            callback: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget item({required String title, required VoidCallback callback}) {
    return GestureDetector(
      onTap: callback,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CText(
              text: title,
              size: 12,
              color: kBlackColor,
            ),
            SizedBox(height: heightSize(8)),
            const Divider(
              color: kGreyColor,
            ),
            SizedBox(height: heightSize(20)),
          ]),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    return Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: kBlackColor,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: kAvatarBgColor,
                child: Image.asset(user),
              ),
            ),
            const Positioned.fill(
                child: Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                radius: 6,
                backgroundColor: kWhiteColor,
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: kBlackColor,
                ),
              ),
            ))
          ],
        ),
        SizedBox(width: widthSize(10)),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => CText(
                text:
                    "Hello ${userController.userData.value.firstName ?? 'User'}",
                size: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Lufga-Medium',
                color: kBoldPrimaryColor,
              ),
            ),
            SizedBox(height: heightSize(5)),
            const CText(
              text: "Online",
              size: 14,
              color: kBlackColor,
            ),
          ],
        ),
        SizedBox(width: widthSize(20)),
        const Icon(
          Feather.edit,
          color: kBlackColor,
          size: 15,
        ),
      ],
    );
  }
}
