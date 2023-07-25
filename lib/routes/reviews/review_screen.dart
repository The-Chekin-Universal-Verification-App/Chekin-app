import 'package:chekinapp/components/input/base_text_input.dart';
import 'package:chekinapp/export.dart';
import 'package:chekinapp/routes/discover/discover_screen.dart';
import 'package:chekinapp/routes/reviews/social_media_screen.dart';
import 'package:flutter/material.dart';

import '../../components/icon_button.dart';
import '../discover/vendor_store.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> with ScaffoldKeyMixin {
  @override
  Widget build(BuildContext context) {
    int dexK = 0;
    AppTheme theme = context.watch();
    ProductModel selectedProduct =
        context.select((DiscoverProvider provider) => provider.selectedProduct);
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, val) => [
                  SliverToBoxAdapter(
                    child: CustomContainer(
                      color: const Color(0xFCF9BFC9).withOpacity(0.79),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: Insets.l),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    CircleAvatar(
                                      backgroundColor:
                                          theme.primary.withOpacity(0.15),
                                      radius: 18,
                                      child: SvgIcon(
                                        R.png.heart2.svg,
                                        size: 20,
                                        color: theme.redButton,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          const VSpace(3),
                          SizedBox(
                              height: 232,
                              child: Image.asset(selectedProduct.productImage)),
                          const VSpace(39),
                          SizedBox(
                            height: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  4,
                                  (index) => CustomContainer(
                                        borderRadius: Corners.s8Border,
                                        color: dexK == index
                                            ? theme.primary
                                            : theme.primary.withOpacity(0.15),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        height: 5,
                                        width:
                                            dexK == index ? context.sp(20) : 18,
                                      )),
                            ),
                          ),
                          const VSpace(15),
                        ],
                      ),
                    ),
                  )
                ],
            body: Padding(
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
                            selectedProduct.storeName,
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
                        selectedProduct.storeName,
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
                        context.loc.productInfo,
                        style: TextStyles.body1
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      if (selectedProduct.isStoreVerified) ...[
                        Material(
                          color: theme.greenButton,
                          borderRadius: Corners.s10Border,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              selectedProduct.isStoreVerified
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
                  Text(selectedProduct.desc,
                      style:
                          TextStyles.body2.copyWith(color: theme.greyWeakTwo)),
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
                          Text(context.loc.reviews,
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
                    context.push(AddReviewScreen());
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
            )),
      ),
    );
  }
}

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({Key? key}) : super(key: key);

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen>
    with ScaffoldKeyMixin {
  bool setReviewVisibility = false;
  bool setBottomVisibility = true;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    ProductModel selectedProduct =
        context.select((DiscoverProvider provider) => provider.selectedProduct);
    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(
        title: context.loc.reviews,
        titleWidget: Text(
          context.loc.reviews,
          style: TextStyles.h5
              .copyWith(fontWeight: FontWeight.w700, color: theme.txt),
        ),
      ),
      bottomSheet: setBottomVisibility == true
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.l),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PrimaryButton(
                    onPressed: () {
                      setState(() {
                        setBottomVisibility = false;
                      });
                      WidgetsBinding.instance.addPostFrameCallback((_) async {
                        await CustomBottomSheet.showCustomBottomSheet(
                            showDragIcon: false,
                            sizeFraction: 0.7,
                            const SocialMediaHandles(),
                            scaffoldKey: scaffoldKey);
                        setState(() {
                          setBottomVisibility = true;
                        });
                      });
                    },
                    label: context.loc.contactVendor,
                    radius: Corners.s20,
                    fullWidth: true,
                  ),
                  const SizedBox(
                    height: 38,
                  )
                ],
              ),
            )
          : null,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (_, val) => [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomContainer(
                    color: const Color(0xFFFFE4CC),
                    borderRadius: Corners.s20Border,
                    padding: EdgeInsets.symmetric(
                        vertical: Insets.l, horizontal: 18),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "4.0",
                              style: TextStyles.h3,
                            ),
                            Text(
                              "/5",
                              style: TextStyles.h5,
                            ),
                          ],
                        ),
                        const VSpace(10),
                        Text(
                          "Based on 10+ reviews from other customers ",
                          textAlign: TextAlign.center,
                          style: TextStyles.body1
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        const VSpace(10),
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star_rounded,
                                      color: theme.greyWeakTwo,
                                    )),
                          ),
                        )
                      ],
                    ),
                  ),
                  VSpace(Insets.l),
                  const ChekInAppDivider(),
                  const VSpace(15),

                  ///add review button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          SvgIcon(
                            R.png.addSquare.svg,
                          ),
                          const HSpace(10),
                          Text(context.loc.addReviews,
                              style: TextStyles.h6
                                  .copyWith(fontWeight: FontWeight.w500)),
                        ],
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: theme.greyWeakTwo,
                      )
                    ],
                  ).clickable(() async {
                    setState(() {
                      setBottomVisibility = false;
                    });
                    WidgetsBinding.instance.addPostFrameCallback((_) async {
                      await CustomBottomSheet.showCustomBottomSheet(
                          showDragIcon: false,
                          sizeFraction: 0.8,
                          const AddingReviewsForm(),
                          scaffoldKey: scaffoldKey);
                      setState(() {
                        setBottomVisibility = true;
                      });
                    });
                  }),
                  const VSpace(15),
                  const ChekInAppDivider(),
                ], //
              ),
            ),
          )
        ],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const VSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(context.loc.customersReviews,
                        style: TextStyles.h6
                            .copyWith(fontWeight: FontWeight.w500)),
                    Row(
                      children: [
                        Text(context.loc.recent,
                            style: TextStyles.h6
                                .copyWith(fontWeight: FontWeight.w500)),
                        const HSpace(5),
                        Icon(
                          setReviewVisibility
                              ? Icons.keyboard_arrow_down_outlined
                              : Icons.keyboard_arrow_right_rounded,
                          color: theme.greyWeakTwo,
                        ),
                      ],
                    )
                  ],
                ).clickable(() {
                  setReviewVisibility = !setReviewVisibility;
                  setState(() {});
                }),
                const VSpace(20),
                ColorBox(
                    onTap: () {},
                    color: theme.primary,
                    child: Column(
                      children: [
                        SizedBox(
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage(
                                  selectedProduct.productImage,
                                ),
                                onBackgroundImageError: (_, err) => Icon(
                                  Icons.image_outlined,
                                  color: theme.grey,
                                ),
                              ),
                              const HSpace(5),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Frank',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyles.body2.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      '8hrs ago',
                                      style: TextStyles.body2.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                      5,
                                      (index) => Icon(
                                            Icons.star_rounded,
                                            color: theme.greyWeakTwo,
                                            size: 15,
                                          )),
                                ),
                              )
                            ],
                          ),
                        ),
                        const VSpace(14),
                        Text(
                          '“A very lovely product. Got mine on time as negotiated and in perfect condition. I recommend you buy from them”',
                          textAlign: TextAlign.center,
                          style: TextStyles.body2.copyWith(
                              color: theme.greyWeakTwo,
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChekInAppDivider extends StatelessWidget {
  const ChekInAppDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Divider(
      color: theme.greyWeakTwo,
    );
  }
}

class AddingReviewsForm extends StatefulWidget {
  const AddingReviewsForm({Key? key}) : super(key: key);

  @override
  State<AddingReviewsForm> createState() => _AddingReviewsFormState();
}

class _AddingReviewsFormState extends State<AddingReviewsForm> {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    ProductModel selectedProduct =
        context.select((DiscoverProvider provider) => provider.selectedProduct);

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 60,
            child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  const HSpace(10),
                  Text(context.loc.addReviews,
                      style:
                          TextStyles.h5.copyWith(fontWeight: FontWeight.w700)),
                ]),
          ),
          Row(
            children: [
              ColorBox(
                onTap: () {},
                color: const Color(0xFFFFE4CC).withOpacity(.79),
                child: SizedBox(
                    height: 120,
                    child: Image.asset(selectedProduct.productImage)),
              ),
              const HSpace(5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      Text(
                        selectedProduct.storeName,
                        style: TextStyles.body1
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      const HSpace(5),
                      Image.asset(R.png.verified.imgPng)
                    ],
                  ),
                  const VSpace(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedProduct.storeName,
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
                ],
              )
            ],
          ),
          const VSpace(10),
          const ChekInAppDivider(),
          const VSpace(20),
          Text(
            context.loc.howWouldYouRateProduct,
            style: TextStyles.body1.copyWith(color: theme.greyWeakTwo),
          ),
          const VSpace(15),
          SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star_rounded,
                        color: theme.greyWeakTwo,
                      )),
            ),
          ),
          const VSpace(10),
          const ChekInAppDivider(),
          const VSpace(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.loc.writeReview,
                style: TextStyles.h7.copyWith(fontWeight: FontWeight.w700),
              ),
              const VSpace(5),
              CustomReviewTextField(
                hintText: context.loc.tellUsWhatYouThink,
                maxLines: 6,
              ),
              const VSpace(3),
              Text(
                '200 ${context.loc.wordsLeft}',
                style: TextStyles.body2.copyWith(
                    color: theme.greyWeakTwo, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const VSpace(51),
          PrimaryButton(
            onPressed: () {
              context.push(const VendorStore());
            },
            label: context.loc.submit,
            fullWidth: true,
            radius: Corners.s20,
          ),
          const VSpace(21),
        ],
      ),
    );
  }
}