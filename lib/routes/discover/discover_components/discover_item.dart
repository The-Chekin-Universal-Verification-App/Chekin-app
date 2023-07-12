import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../discover_screen.dart';

class DiscoverItem extends StatelessWidget {
  const DiscoverItem(
      {super.key,
      // this.viewType = ViewType.listView,
      required this.product,
      this.color,
      required this.onItemTap});

  final ProductModel product;
  final Color? color;
  final Function() onItemTap;
  @override
  Widget build(BuildContext context) {
    ViewType viewType =
        context.select((DiscoverProvider provider) => provider.viewType);

    AppTheme theme = context.watch();
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ColorBox(
        color: color ?? theme.primary,
        onTap: onItemTap,
        child: SizedBox(
          width: context.widthPx,
          child: viewType == ViewType.listView
              ? Row(
                  children: [
                    Flexible(
                        flex: 1,
                        child: SizedBox(
                            height: 109,
                            child: Image.asset(product.productImage))),
                    const HSpace(10),
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.itemName,
                              style: TextStyles.h6
                                  .copyWith(fontWeight: FontWeight.w500)),
                          const VSpace(5),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(product.storeName,
                                  style: TextStyles.h7
                                      .copyWith(fontWeight: FontWeight.w700)),
                              const HSpace(5),
                              Image.asset(R.png.verified.imgPng)
                            ],
                          ),
                          const VSpace(5),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                  MoneyInputFormatter()
                                      .toCurrencyString(product.price),
                                  style: TextStyles.h7
                                      .copyWith(fontWeight: FontWeight.w500)),
                              const HSpace(8),
                              CustomContainer(
                                height: 25.0,
                                width: 25.0,
                                borderRadius: Corners.s5Border,
                                color: theme.primary.withOpacity(0.15),
                                child: Center(
                                  child: SvgIcon(
                                    R.png.heart2.svg,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                        flex: 2,
                        child: SizedBox(
                            height: 109,
                            child: Image.asset(product.productImage))),
                    const VSpace(5),
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(product.itemName,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyles.h6
                                  .copyWith(fontWeight: FontWeight.w500)),
                          const VSpace(9),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(product.storeName,
                                  style: TextStyles.h7
                                      .copyWith(fontWeight: FontWeight.w700)),
                              const HSpace(5),
                              Image.asset(R.png.verified.imgPng)
                            ],
                          ),
                          const VSpace(10),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                  MoneyInputFormatter()
                                      .toCurrencyString(product.price),
                                  style: TextStyles.h7
                                      .copyWith(fontWeight: FontWeight.w500)),
                              const HSpace(8),
                              CustomContainer(
                                height: 25.0,
                                width: 25.0,
                                borderRadius: Corners.s5Border,
                                color: theme.primary.withOpacity(0.15),
                                child: Center(
                                  child: SvgIcon(
                                    R.png.heart2.svg,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
