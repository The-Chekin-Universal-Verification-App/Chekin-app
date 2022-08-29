import 'package:chekin/screen/app/dashboard/controller/top_rated_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../constants/assets_path.dart';
import '../../../../constants/value.dart';
import '../../../../shared/appbar.dart';
import '../../../../shared/custom_text.dart';
import '../../../../shared/search_container.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class TopRated extends StatelessWidget {
  const TopRated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TopRatedController topRatedController = Get.find();
    topRatedController.getBusinessReviews();
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
                          itemRated(
                            title: "LUX-345839",
                            subtitle: "Aspire Stores",
                          ),
                          Row(
                            children: [
                              const CText(
                                text: "Details",
                                color: kGreyColor,
                                fontFamily: 'Lufga-SemiBold',
                                size: 16,
                                letterSpacing: 0.7,
                              ),
                              SizedBox(width: widthSize(5)),
                              const Expanded(
                                child: Divider(
                                  color: kGreyColor,
                                  thickness: 1.5,
                                ),
                              ),
                            ],
                          ),
                          const Gap(10),
                          const CText(
                            text:
                                "Aliqua id fugiat nostrud irure ex duis ea quis id quis ad et. Sunt qui esse pariatur duis deserunt mollit dolore cillum minim tempor enim.  Aliqua id fugiat nostrud irure ex duis ea quis id quis ad et. Sunt qui esse pariatur duis deserunt mollit dolore cillum minim tempor enim. Aliqua id fugiat nostrud irure ex duis ea quis id quis ad et. Sunt quiI. \nInsta:@joanah.123, Twitter: @Joanah 123",
                            size: 16,
                            color: kTextColor,
                          ),
                          const Gap(10),
                          Row(
                            children: [
                              const CText(
                                text: "Review",
                                color: kGreyColor,
                                fontFamily: 'Lufga-SemiBold',
                                size: 16,
                                letterSpacing: 0.7,
                              ),
                              SizedBox(width: widthSize(5)),
                              const Expanded(
                                child: Divider(
                                  color: kGreyColor,
                                  thickness: 1.5,
                                ),
                              ),
                              const Gap(5),
                              GestureDetector(
                                onTap: () {
                                  _addReviewBottomSheet(context);
                                },
                                child: const CText(
                                  text: "ADD REVIEW",
                                  color: kBoldPrimaryColor,
                                  fontFamily: 'Lufga-SemiBold',
                                  fontWeight: FontWeight.bold,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                          const Gap(10),

                          //Review Section
                          Expanded(
                            child: Obx(
                              () => topRatedController.loadingReviews.value
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : Obx(
                                      () => topRatedController.reviews.isEmpty
                                          ? const Center(
                                              child: CText(
                                              text: "No reviews at the moment",
                                              size: 16,
                                              color: kTextColor,
                                            ))
                                          : Obx(
                                              () => ListView.builder(
                                                  itemCount: topRatedController
                                                      .reviews.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      color: kTextColor
                                                          .withOpacity(0.3),
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20,
                                                          vertical: 20),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  CircleAvatar(
                                                                    radius: 18,
                                                                    child: Image
                                                                        .asset(
                                                                            user),
                                                                  ),
                                                                  const Gap(10),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: const [
                                                                      CText(
                                                                        text:
                                                                            "Van Nga",
                                                                        size:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                      CText(
                                                                        text:
                                                                            "Ondo Town",
                                                                        size:
                                                                            15,
                                                                      )
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              RatingBar.builder(
                                                                  initialRating:
                                                                      4,
                                                                  onRatingUpdate:
                                                                      (double
                                                                          value) {},
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  unratedColor:
                                                                      klightPrimaryColor
                                                                          .withOpacity(
                                                                              0.5),
                                                                  itemSize: 20,
                                                                  itemPadding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          2),
                                                                  itemBuilder:
                                                                      (context,
                                                                              _) =>
                                                                          const Icon(
                                                                            Icons.star,
                                                                            color:
                                                                                kPrimaryColor,
                                                                          ))
                                                            ],
                                                          ),
                                                          const Gap(10),
                                                          const CText(
                                                            text:
                                                                "Aliqua id fugiat nostrud irure ex duis ea quis id quis ad et. Sunt qui esse pariatur duis deserunt mollit dolore cillum minim tempor enim.",
                                                            size: 15,
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                            ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget itemRated({
    required String title,
    required String subtitle,
  }) {
    return GestureDetector(
      child: Container(
        height: heightSize(80),
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
                  size: 13,
                  fontWeight: FontWeight.w700,
                  fontFamily: '',
                ),
                SizedBox(height: heightSize(10)),
                Row(
                  children: [
                    CText(
                      text: subtitle,
                      color: kBlackColor,
                      size: 25,
                    ),
                    SizedBox(width: widthSize(10)),
                    const CircleAvatar(
                      radius: 8,
                      backgroundColor: kVerifiedColor,
                      child: Icon(
                        Feather.check,
                        color: kBlackColor,
                        size: 13,
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

_addReviewBottomSheet(BuildContext context) {
  Get.bottomSheet(
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: MediaQuery.of(context).size.height * 0.30,
      color: kBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CText(
            text: 'REVIEW',
            size: 20,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lufga-SemiBold',
          ),
          TextField(
            maxLines: 3,
            maxLength: 150,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingBar.builder(
                  initialRating:
                  4,
                  onRatingUpdate:
                      (double
                  value) {},
                  direction: Axis
                      .horizontal,
                  unratedColor:
                  klightPrimaryColor
                      .withOpacity(
                      0.5),
                  itemSize: 23,
                  itemPadding: const EdgeInsets
                      .symmetric(
                      horizontal:
                      2),
                  itemBuilder:
                      (context,
                      _) =>
                  const Icon(
                    Icons.star,
                    color:
                    kPrimaryColor,
                  )
              ),
              const Gap(20),

              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: heightSize(40),
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: kBlackColor),
                        borderRadius:
                        BorderRadius.circular(Values().buttonRadius),
                      ),
                      child: const Center(
                        child: CText(
                          text: "CANCEL",
                          color: kBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  GestureDetector(
                    onTap: ()  {},
                    child: Container(
                      height: heightSize(40),
                      width: 50,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius:
                        BorderRadius.circular(Values().buttonRadius),
                      ),
                      child: const Center(
                        child: CText(
                          text: "SEND",
                          color: kBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}
