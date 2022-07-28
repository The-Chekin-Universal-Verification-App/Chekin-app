// ignore_for_file: invalid_use_of_protected_member

import 'package:chekin/constants/assets_path.dart';
import 'package:chekin/constants/value.dart';
import 'package:chekin/shared/appbar.dart';
import 'package:chekin/shared/custom_text.dart';
import 'package:chekin/shared/search_container.dart';
import 'package:chekin/utils/colors.dart';
import 'package:chekin/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../controller/dashboard_controller.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DashboardController dashboardController = Get.find();
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    const CustomAppBar(),
                    SizedBox(height: heightSize(40)),
                    Expanded(
                      child: Column(
                        children: [
                          const SearchContainer(),
                          SizedBox(height: heightSize(20)),
                          Stack(
                            children: [
                              Container(
                                height: heightSize(109),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Values().buttonRadius),
                                  image: DecorationImage(
                                    image: AssetImage(ads),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 28.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Spacer(),
                                          CText(
                                            text: "75%",
                                            fontFamily: 'Lufga-SemiBold',
                                            size: 24,
                                            color: kWhiteColor,
                                          ),
                                          CText(
                                            text: "Discount",
                                            fontFamily: 'Lufga-SemiBold',
                                            size: 20,
                                            color: kPrimaryColor,
                                          ),
                                          CText(
                                            text: "Wednesday",
                                            fontFamily: 'Lufga-SemiBold',
                                            size: 12,
                                            color: kWhiteColor,
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(height: heightSize(20)),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 38.0),
                          //   child: Row(
                          //     children: [
                          //       const CText(
                          //         text: "Top Rated",
                          //         color: kBlackColor,
                          //         fontFamily: 'Lufga-SemiBold',
                          //         size: 13,
                          //       ),
                          //       SizedBox(width: widthSize(14)),
                          //       const Expanded(
                          //         child: Divider(
                          //           color: kBlackColor,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: heightSize(10)),
                          // item(
                          //   title: "LUX-345839",
                          //   subtitle: "Aspir Stores",
                          //   callback: () {},
                          // ),
                          // item(
                          //   title: "LUX-345839",
                          //   subtitle: "Aspir Stores",
                          //   callback: () {},
                          // ),
                          Obx(
                            () => dashboardController
                                    .businesses.value.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.only(left: 38.0),
                                    child: Row(
                                      children: [
                                        const CText(
                                          text: "Popular",
                                          color: kBlackColor,
                                          fontFamily: 'Lufga-SemiBold',
                                          size: 13,
                                        ),
                                        SizedBox(width: widthSize(14)),
                                        const Expanded(
                                          child: Divider(
                                            color: kBlackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ),
                          SizedBox(height: heightSize(10)),
                          Obx(
                            () => dashboardController.loadingBusiness.value ==
                                    false
                                ? dashboardController
                                        .businesses.value.isNotEmpty
                                    ? Expanded(
                                        child: ListView.builder(
                                          itemCount: dashboardController
                                              .businesses.value.length,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return item(
                                              title: "LUX-345839",
                                              subtitle: "Aspir Stores",
                                              callback: () {},
                                            );
                                          },
                                        ),
                                      )
                                    : Expanded(
                                        child: Column(
                                          children: const [
                                            Spacer(),
                                            CText(
                                              text:
                                                  "No Business Data at the moment",
                                              color: kBlackColor,
                                              fontFamily: 'Lufga-SemiBold',
                                              size: 13,
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                      )
                                : const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                          ),

                          // item(
                          //   title: "LUX-345839",
                          //   subtitle: "Aspir Stores",
                          //   callback: () {},
                          // ),
                          // item(
                          //   title: "LUX-345839",
                          //   subtitle: "Aspir Stores",
                          //   callback: () {},
                          // ),
                          // item(
                          //   title: "LUX-345839",
                          //   subtitle: "Aspir Stores",
                          //   callback: () {},
                          // ),
                          // item(
                          //   title: "LUX-345839",
                          //   subtitle: "Aspir Stores",
                          //   callback: () {},
                          // ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget item(
      {required String title,
      required String subtitle,
      required VoidCallback callback}) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: heightSize(64),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: kGreyColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(Values().buttonRadius),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Values().buttonRadius),
              child: Image.asset(product),
            ),
            SizedBox(width: widthSize(20)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CText(
                  text: title,
                  color: kBoldPrimaryColor,
                  size: 10,
                  fontWeight: FontWeight.w700,
                  fontFamily: '',
                ),
                SizedBox(height: heightSize(10)),
                Row(
                  children: [
                    CText(
                      text: subtitle,
                      color: kBlackColor,
                      size: 22,
                    ),
                    SizedBox(width: widthSize(10)),
                    const CircleAvatar(
                      radius: 8,
                      backgroundColor: kVerifiedColor,
                      child: Icon(
                        Feather.check,
                        color: kBlackColor,
                        size: 10,
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
