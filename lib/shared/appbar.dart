import 'package:chekin/constants/assets_path.dart';
import 'package:chekin/screen/app/user/controller/user_controller.dart';
import 'package:chekin/shared/custom_text.dart';
import 'package:chekin/utils/colors.dart';
import 'package:chekin/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

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
                    "Hello ${userController.userData.value.firstName ?? 'User'},",
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
        const Spacer(),
        const Icon(
          Octicons.three_bars,
          color: kBlackColor,
        ),
      ],
    );
  }
}
