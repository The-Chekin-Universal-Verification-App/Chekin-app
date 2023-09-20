import 'package:chekinapp/components/input/base_text_input.dart';
import 'package:chekinapp/core/models/business_model.dart';
import 'package:chekinapp/export.dart';
import 'package:chekinapp/routes/discover/discover_screen.dart';
import 'package:chekinapp/routes/reviews/social_media_screen.dart';
import 'package:flutter/material.dart';

import '../../components/icon_button.dart';
import '../../components/msc/loader_state_widget.dart';
import '../../core/commands/business_command.dart';
import '../../core/models/business_review_model.dart';
import '../../core/providers/business_provider.dart';
import '../discover/vendor_store.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen>
    with ScaffoldKeyMixin {
  @override
  initState() {
    super.initState();
    // DiscoverProvider selectedProd = Provider.of(context, listen: false);
    // BusinessCommand(context).getBusinessReviews(
    //     businessId: selectedProd
    //         .selectedProduct.business); // this get the review on business
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    ProductModel selectedProduct =
        context.select((DiscoverProvider provider) => provider.selectedProduct);
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomContainer(
              color: const Color(0xFCF9BFC9).withOpacity(0.79),
              child: Column(
                children: [
                  const VSpace(30),
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
                            CircleAvatar(
                              backgroundColor: theme.primary.withOpacity(0.15),
                              radius: 18,
                              child: SvgIcon(
                                R.png.heart2.svg,
                                size: 18,
                                color: theme.redButton,
                              ),
                            ),
                          ]),
                    ),
                  ),
                  const VSpace(3),
                  SizedBox(
                      height: 232,
                      child: PageView.builder(
                        onPageChanged: (index) {
                          currentIndex = index;
                          setState(() {});
                        },
                        itemCount: selectedProduct.images.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(
                            selectedProduct.images[index],
                            errorBuilder: (e, c, d) => const SizedBox(
                                child: Icon(
                              Icons.image_outlined,
                              size: 232 / 2,
                              color: Colors.black54,
                            )),
                          );
                        },
                      )),
                  const VSpace(39),
                  SizedBox(
                    height: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          4,
                          (index) => CustomContainer(
                                borderRadius: Corners.s8Border,
                                color: currentIndex == index
                                    ? theme.primary
                                    : theme.primary.withOpacity(0.15),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                height: 5,
                                width:
                                    currentIndex == index ? context.sp(20) : 18,
                              )),
                    ),
                  ),
                  const VSpace(15),
                ],
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
                            selectedProduct.business!.name,
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
                        selectedProduct.name,
                        style:
                            TextStyles.h6.copyWith(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        selectedProduct.business!.luxCode,
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
                  Text(selectedProduct.info,
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
                  const VSpace(81),
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
  bool setReviewVisibility = true;
  bool setBottomVisibility = true;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    List<BusinessReviewModel> reviews =
        context.select((BusinessProvider provider) => provider.reviews);
    String topRating =
        context.select((BusinessProvider provider) => provider.topTenRating);

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
                  const VSpace(10),
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
                    height: 15,
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
                              double.parse(topRating).toString(),
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
                        StarRatingItem(
                            ratings: topRating,
                            startSize: 30,
                            onTapRating: (val) {})
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const VSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.loc.customersReviews,
                      style:
                          TextStyles.h6.copyWith(fontWeight: FontWeight.w500)),
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
              Expanded(
                child: Visibility(
                  visible: setReviewVisibility,
                  child: LoaderStateItem(
                    isLoading: false,
                    item: reviews,
                    widgetOnLoadSuccess: RefreshIndicator(
                      onRefresh: () async {},
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: reviews.length,
                          itemBuilder: (BuildContext context, index) =>
                              ReviewItem(
                                reviewObject: reviews[index],
                              )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewItem extends StatefulWidget {
  const ReviewItem({
    super.key,
    required this.reviewObject,
  });

  final BusinessReviewModel reviewObject;

  @override
  State<ReviewItem> createState() => _ReviewItemState();
}

class _ReviewItemState extends State<ReviewItem> {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: ColorBox(
          onTap: () {},
          color: theme.primary,
          child: Column(
            children: [
              SizedBox(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.network(
                        widget.reviewObject.user['profileImageUrl'],
                        errorBuilder: (_, k, err) => Icon(
                          Icons.image_outlined,
                          color: theme.grey,
                          size: 25,
                        ),
                      ),
                    ),
                    const HSpace(5),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.reviewObject.user['firstName'] +
                                widget.reviewObject.user['lastName'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.body2.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            widget.reviewObject.updatedAt,
                            style: TextStyles.body2.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    StarRatingItem(
                        ratings: widget.reviewObject.rating.toString(),
                        onTapRating: (val) {})
                  ],
                ),
              ),
              const VSpace(14),
              Text(
                widget.reviewObject.review,
                textAlign: TextAlign.center,
                style: TextStyles.body2.copyWith(
                    color: theme.greyWeakTwo,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              ),
            ],
          )),
    );
  }
}

class StarRatingItem extends StatefulWidget {
  const StarRatingItem(
      {super.key,
      required this.ratings,
      this.onTapRating,
      this.startSize = 15});

  final String ratings;
  final double startSize;
  final Function(int val)? onTapRating;
  @override
  State<StarRatingItem> createState() => _StarRatingItemState();
}

class _StarRatingItemState extends State<StarRatingItem> {
  @override
  initState() {
    super.initState();
    generateEquivalentRating();
  }

  List<int> rateEquivalent = [];

  generateEquivalentRating({int? length}) {
    late int rating;
    if (length == null) {
      rating = double.parse(widget.ratings).toInt();
    } else {
      setState(() {
        rating = length;
      });
    }
    rateEquivalent = List.generate(rating, (index) => index);
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          return InkWell(
            borderRadius: Corners.s8Border,
            onTap: widget.onTapRating == null
                ? () {
                    generateEquivalentRating(length: index + 1);
                  }
                : () {
                    generateEquivalentRating(length: index + 1);
                    widget.onTapRating!(index + 1);
                  },
            child: Icon(
              Icons.star_rounded,
              color: rateEquivalent.contains(index) == true
                  ? Colors.yellow.shade800
                  : theme.greyWeakTwo,
              size: widget.startSize,
            ),
          );
        }),
      ),
    );
  }
}

class ChekInAppDivider extends StatelessWidget {
  const ChekInAppDivider({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Divider(
      color: color ?? theme.greyWeakTwo,
    );
  }
}

class AddingReviewsForm extends StatefulWidget {
  const AddingReviewsForm({Key? key}) : super(key: key);

  @override
  State<AddingReviewsForm> createState() => _AddingReviewsFormState();
}

class _AddingReviewsFormState extends State<AddingReviewsForm> with FormMixin {
  MakeBusinessReviewModel model = MakeBusinessReviewModel.init();
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    BusinessModel selectedBusiness = context
        .select((BusinessProvider provider) => provider.selectedBusiness);

    return SingleChildScrollView(
      child: Form(
        key: formKey,
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
                        style: TextStyles.h5
                            .copyWith(fontWeight: FontWeight.w700)),
                  ]),
            ),
            Row(
              children: [
                ColorBox(
                  onTap: () {},
                  color: const Color(0xFFFFE4CC).withOpacity(.79),
                  child: SizedBox(
                      height: 120,
                      child: Image.network(selectedBusiness.businessImage)),
                ),
                const HSpace(5),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: Text(
                              selectedBusiness.owner,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.body1
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                          const HSpace(5),
                          Image.asset(R.png.verified.imgPng)
                        ],
                      ),
                      const VSpace(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Text(
                              selectedBusiness.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.h6
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            selectedBusiness.luxCode,
                            style: TextStyles.body1.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const VSpace(10),
            const ChekInAppDivider(),
            const VSpace(20),
            Text(
              context.loc.howWouldYouRateBusiness,
              style: TextStyles.body1.copyWith(color: theme.greyWeakTwo),
            ),
            const VSpace(15),
            StarRatingItem(
              ratings: '1',
              startSize: 25,
              onTapRating: (val) {
                model = model.copyWith(rating: val.toString());
              },
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
                  validator: Validator.string(minLength: 3),
                  onChange: (val) {
                    model = model.copyWith(review: val);
                  },
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
                validate(() {
                  load(() => BusinessCommand(context).reviewBusiness(
                      businessId: selectedBusiness.id, model: model));
                });
                // context.push(const VendorStore());
              },
              label: context.loc.submit,
              fullWidth: true,
              loading: isLoading,
              radius: Corners.s20,
            ),
            const VSpace(21),
          ],
        ),
      ),
    );
  }
}
