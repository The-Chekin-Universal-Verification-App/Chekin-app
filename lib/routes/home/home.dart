import 'dart:math';

import 'package:chekinapp/components/input/base_text_input.dart';
import 'package:chekinapp/core/commands/business_command.dart';
import 'package:chekinapp/core/commands/initialization_cmd.dart';
import 'package:chekinapp/routes/document_upload/upload_document_main_screen.dart';
import 'package:chekinapp/routes/home/popular.dart';
import 'package:chekinapp/routes/home/top_rated.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../../core/models/business_model.dart';
import '../../core/providers/business_provider.dart';
import '../business/businesses.dart';
import 'advert_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    UserModel user = context.select((AuthProvider provider) => provider.user);
    // List<BusinessModel> businesses = context
    //     .select((BusinessProvider business) => business.allAvailableBusiness);

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await InitializationCmd(context).refreshUser();
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: Insets.l),
            clipBehavior: Clip.none,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: CircleAvatar(
                            radius: 25,
                            child: Image.network(
                              user.profileImageUrl,
                              errorBuilder: (context, obj, trac) =>
                                  const Icon(Icons.image_sharp),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 0,
                          child: CircleAvatar(
                            radius: 6,
                            backgroundColor: theme.greenButton,
                          ),
                        )
                      ],
                    ),
                    CustomContainer(
                      height: 40,
                      width: 40,
                      // padding: EdgeInsets.all(5),
                      borderRadius: Corners.s5Border,
                      color: theme.primary.withOpacity(0.15),
                      child: Center(
                        child: Stack(
                          children: [
                            SvgIcon(
                              R.png.bell.svg,
                              size: context.sp(20),
                            ),
                            Positioned(
                                right: 0,
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: Colors.white,
                                  child: Transform.rotate(
                                      angle: 30,
                                      child: CustomContainer(
                                        height: 6,
                                        width: 6,
                                        color: theme.redButton,
                                      )),
                                )),
                          ],
                        ),
                      ),
                    ).clickable(() {
                      // context.push(const PaymentScreen());
                      // print(user.business
                      //     .toString()); // context.push(UploadDocumentMainScreen());
                    }),
                  ],
                ),
                const VSpace(15),
                Wrap(
                  children: [
                    Text(context.loc.hello,
                        style: TextStyles.h4.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 28)),
                    const HSpace(10),
                    Text(user.firstName,
                        style: TextStyles.h3.copyWith(fontSize: 30)),
                  ],
                ),
                const VSpace(5),
                Text(context.loc.goodToHaveYou,
                    style: TextStyles.body1.copyWith(color: theme.greyText)),
                const VSpace(15),
                CustomFormTextFieldWithBorder(
                  hintText: context.loc.search,
                  isRequired: false,
                  // onFieldSubmitted: (v) {
                  //   context.read<ProductProvider>().sortProduct =
                  //       _searchController.text;
                  //
                  // },
                  prefix: UnconstrainedBox(
                    child: SvgIcon(
                      R.png.search.svg,
                      size: 22,
                    ),
                  ).clickable(() {
                    //
                    // BusinessCommand(context).getBusiness();
                  }),
                  // suffix: UnconstrainedBox(
                  //   child: SvgIcon(
                  //     R.png.filter.svg,
                  //     size: 25,
                  //   ),
                  // ),
                ),
                const VSpace(20),
                const AdvertSlider(),
                const VSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.loc.topRated,
                      style:
                          TextStyles.h6.copyWith(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      context.loc.seeAll,
                      style: TextStyles.body2.copyWith(color: theme.primary),
                    ).rippleClick(() {
                      context.push(const BusinessScreen());
                    }),
                  ],
                ),
                const VSpace(10),
                const TopRated(),
                const VSpace(23),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.loc.popular,
                      style:
                          TextStyles.h6.copyWith(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      context.loc.seeAll,
                      style: TextStyles.body2.copyWith(color: theme.primary),
                    ).rippleClick(() {
                      context.push(const BusinessScreen());
                    }),
                  ],
                ),
                const VSpace(10),
                const Popular(),
                const VSpace(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
