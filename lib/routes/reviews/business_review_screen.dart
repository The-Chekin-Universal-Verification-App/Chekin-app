import 'package:chekinapp/core/commands/business_command.dart';
import 'package:chekinapp/core/providers/business_provider.dart';
import 'package:chekinapp/export.dart';
import 'package:chekinapp/routes/reviews/review_screen.dart';
import 'package:chekinapp/routes/reviews/social_media_screen.dart';
import 'package:flutter/material.dart';

import '../../components/icon_button.dart';
import '../../core/models/business_model.dart';

class BusinessReviewScreen extends StatefulWidget {
  const BusinessReviewScreen({Key? key}) : super(key: key);

  @override
  State<BusinessReviewScreen> createState() => _BusinessReviewScreenState();
}

class _BusinessReviewScreenState extends State<BusinessReviewScreen>
    with ScaffoldKeyMixin {
  int currentIndex = 0;
  @override
  void initState() {
    BusinessCommand(context).getBusinessReviews(
        businessId: BusinessCommand(context).business.selectedBusiness.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    BusinessModel selectedBusiness = context
        .select((BusinessProvider provider) => provider.selectedBusiness);

    return Scaffold(
      key: scaffoldKey,
      body: Column(
        children: [
          CustomContainer(
            color: const Color(0xFCF9BFC9).withOpacity(0.79),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: Insets.l),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IcButton(
                              SvgIcon(
                                R.png.arrowLeftIcon.svg,
                                color: theme.black,
                                // size: Sizes.hit,
                              ),
                              onPressed: () => Navigator.pop(context),
                              radius: Corners.s0,
                            ),
                          ]),
                    ),
                  ),
                  const VSpace(10),
                  SizedBox(
                      height: 232,
                      child: Image.network(
                        selectedBusiness.businessImage,
                        errorBuilder: (e, c, d) => const SizedBox(
                            child: Icon(
                          Icons.image_outlined,
                          size: 232 / 2,
                          color: Colors.black54,
                        )),
                      )),
                  const VSpace(39),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.l),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VSpace(28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      children: [
                        Text(
                          selectedBusiness.name,
                          style: TextStyles.body1
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        const HSpace(5),
                        Image.asset(R.png.verified.imgPng)
                      ],
                    ),
                    Text(
                      'luxCode',
                      style: TextStyles.body1.copyWith(
                          fontWeight: FontWeight.w500, color: theme.primary),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedBusiness.owner,
                      style:
                          TextStyles.h6.copyWith(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Lux-330458',
                      style: TextStyles.body1.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const VSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.loc.businessInfo,
                      style: TextStyles.body1
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    if (selectedBusiness.verified) ...[
                      Material(
                        color: theme.greenButton,
                        borderRadius: Corners.s10Border,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            selectedBusiness.verified
                                ? context.loc.verified
                                : '',
                            style: TextStyles.body3.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ],
                ),
                const VSpace(14),
                Text(selectedBusiness.description,
                    style: TextStyles.body2.copyWith(color: theme.greyWeakTwo)),
                const VSpace(25),
                const ChekInAppDivider(),
                const VSpace(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      children: [
                        SvgIcon(R.png.messageFavorite.svg),
                        const HSpace(10),
                        Text(context.loc.seeStoreReviews,
                            style: TextStyles.h6
                                .copyWith(fontWeight: FontWeight.w500)),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: theme.greyWeakTwo,
                    )
                  ],
                ).clickable(() {
                  context.push(const AddReviewScreen());
                }),
                const VSpace(10),
                const ChekInAppDivider(),
                const VSpace(61),
                PrimaryButton(
                  onPressed: () {
                    CustomBottomSheet.showCustomBottomSheet(
                        const SocialMediaHandles(),
                        sizeFraction: 0.7,
                        showDragIcon: false,
                        scaffoldKey: scaffoldKey);
                  },
                  label: context.loc.contactVendor,
                  radius: Corners.s20,
                  fullWidth: true,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
