import 'package:cached_network_image/cached_network_image.dart';
import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';

import '../../core/models/business_model.dart';
import '../../core/providers/business_provider.dart';
import '../reviews/business_review_screen.dart';

class BusinessItemCategory extends StatelessWidget {
  const BusinessItemCategory(
      {super.key, this.color, required this.businessModel});
  final Color? color;
  final BusinessModel businessModel;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Container(
      constraints: const BoxConstraints(maxHeight: 180, maxWidth: 170),
      decoration: BoxDecoration(
        borderRadius: Corners.s10Border,
        color:
            color?.withOpacity(0.7) ?? Theme.of(context).colorScheme.background,
        // color:
        //     color?.withOpacity(0.7) ?? const Color(0xFFF9BFC9).withOpacity(0.7),
        //    boxShadow: Shadows.small
      ),
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.only(top: 2, bottom: 6),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: CustomContainer(
              width: context.widthPx,
              color: theme.dividerColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              // ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    // horizontal: 1.0,
                    ),
                child: CachedNetworkImage(
                  imageUrl: businessModel.businessImage,
                  fit: BoxFit.cover,

                  ///
                  errorWidget: (BuildContext context, i, b) {
                    return const SizedBox(
                        child: Icon(
                      Icons.image_outlined,
                      size: 35,
                    ));
                  },
                ),
              ),
            ),
          ),
          const VSpace(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    businessModel.luxCode,
                    style: TextStyles.body2
                        .copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ),
                const VSpace(3),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Text(
                          businessModel.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.body2.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const HSpace(5),
                      Image.asset(R.png.verified.imgPng)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).clickable(() {
      context.read<BusinessProvider>().selectABusiness = businessModel;
      context.push(const BusinessReviewScreen());
    });
  }
}
