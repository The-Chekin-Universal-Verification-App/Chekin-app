import 'dart:math';

import 'package:chekinapp/components/input/base_text_input.dart';
import 'package:chekinapp/routes/home/popular.dart';
import 'package:chekinapp/routes/home/top_rated.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../../components/msc/loader_state_widget.dart';
import 'advert_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: Insets.l),
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
                      CircleAvatar(
                        radius: 25,
                        // backgroundImage: AssetImage(R.png.man.imgPng),

                        child: Image.asset(
                          R.png.man.imgPng,
                          errorBuilder: (BuildContext context, _, d) =>
                              const Icon(Icons.person),
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
                  ),
                ],
              ),
              const VSpace(15),
              Wrap(
                children: [
                  Text(context.loc.hello,
                      style: TextStyles.h4
                          .copyWith(fontWeight: FontWeight.w400, fontSize: 28)),
                  Text(R.S.userName,
                      style: TextStyles.h3.copyWith(fontSize: 30)),
                ],
              ),
              const VSpace(5),
              Text(context.loc.goodToHaveYou,
                  style: TextStyles.body1.copyWith(color: theme.greyText)),
              const VSpace(15),
              CustomFormTextFieldWithBorder(
                hintText: context.loc.search,
                prefix: UnconstrainedBox(
                  child: SvgIcon(
                    R.png.search.svg,
                    size: 22,
                  ),
                ),
                suffix: UnconstrainedBox(
                  child: SvgIcon(
                    R.png.filter.svg,
                    size: 25,
                  ),
                ),
              ),
              const VSpace(20),
              const AdvertSlider(),
              const VSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.loc.topRated,
                    style: TextStyles.h6.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    context.loc.seeAll,
                    style: TextStyles.body2.copyWith(color: theme.primary),
                  ).rippleClick(() {}),
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
                    style: TextStyles.h6.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    context.loc.seeAll,
                    style: TextStyles.body2.copyWith(color: theme.primary),
                  ).rippleClick(() {}),
                ],
              ),
              const VSpace(10),
              const Popular(),
              const VSpace(10),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, this.color, required this.product});
  final Color? color;
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 170),
      decoration: BoxDecoration(
        borderRadius: Corners.s10Border,
        color:
            color?.withOpacity(0.7) ?? const Color(0xFFF9BFC9).withOpacity(0.7),
      ),
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.only(left: 2, right: 2, bottom: 10, top: 1),
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Image.asset(
                product.productImage,
                fit: BoxFit.cover,
              )),
          const VSpace(3),
          Text(
            product.itemName,
            style: TextStyles.body2
                .copyWith(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          const VSpace(3),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                product.itemName,
                style: TextStyles.body2
                    .copyWith(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              const HSpace(5),
              Image.asset(R.png.verified.imgPng)
            ],
          ),
        ],
      ),
    );
  }
}
