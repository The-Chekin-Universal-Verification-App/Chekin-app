import 'package:chekin/constants/assets_path.dart';
import 'package:chekin/shared/custom_text.dart';
import 'package:chekin/utils/colors.dart';
import 'package:chekin/utils/sizes.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isCheckedLUX = false;
  bool isCheckedNotifications = false;
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          SizedBox(height: heightSize(49)),
                          const CText(
                            text: "ACCOUNT",
                            color: kBoldPrimaryColor,
                            size: 14,
                            fontFamily: 'Lufga-SemiBold',
                          ),
                          const CText(
                            text: "owoyemi818@gmail.com",
                            color: kBlackColor,
                            size: 14,
                            fontFamily: '',
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: heightSize(20)),
                          item2(
                            title: 'Auto copy LUX Code on tap',
                            widget: Switch(
                              value: isCheckedLUX,
                              onChanged: (bool value) {
                                setState(() {
                                  isCheckedLUX = value;
                                });
                              },
                            ),
                          ),
                          item2(
                            title: 'Notifications',
                            widget: Switch(
                              value: isCheckedNotifications,
                              onChanged: (bool value) {
                                setState(() {
                                  isCheckedNotifications = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: heightSize(36)),
                          const CText(
                            text: "App Details",
                            color: kBoldPrimaryColor,
                            size: 16,
                          ),
                          SizedBox(height: heightSize(36)),
                          item(
                            title: 'About CHEKIN',
                            callback: () {},
                          ),
                          item(
                            title: 'Privacy Policy',
                            callback: () {},
                          ),
                          item(
                            title: 'Remove this device/ Log Out',
                            callback: () {},
                          )
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

  Widget item2({required String title, required Widget widget}) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CText(
                text: title,
                size: 14,
                color: kBlackColor,
              ),
              const Spacer(),
              widget
            ],
          ),
          SizedBox(height: heightSize(2)),
          const Divider(
            color: kGreyColor,
          ),
          SizedBox(height: heightSize(20)),
        ]);
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            const CText(
              text: "Hello Tosin,",
              size: 18,
              fontWeight: FontWeight.w700,
              fontFamily: 'Lufga-Medium',
              color: kWhiteColor,
            ),
            SizedBox(height: heightSize(5)),
            const CText(
              text: "Online",
              size: 14,
              color: kBlackColor,
            ),
          ],
        ),
      ],
    );
  }
}
