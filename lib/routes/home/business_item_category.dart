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
    return Container(
      constraints: const BoxConstraints(maxHeight: 180, maxWidth: 170),
      decoration: BoxDecoration(
          borderRadius: Corners.s10Border,
          color: color?.withOpacity(0.7) ??
              Theme.of(context).colorScheme.background,
          // color:
          //     color?.withOpacity(0.7) ?? const Color(0xFFF9BFC9).withOpacity(0.7),
          boxShadow: Shadows.small),
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.only(top: 2, bottom: 6),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Image.network(
                businessModel.businessImage,
                fit: BoxFit.cover,
                errorBuilder: (a, b, c) => const SizedBox(
                    child: Icon(
                  Icons.image_outlined,
                  size: 35,
                )),
              ).center()),
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
