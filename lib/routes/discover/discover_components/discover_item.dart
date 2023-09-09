import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../discover_screen.dart';

class DiscoverItem extends StatelessWidget {
  const DiscoverItem(
      {super.key, required this.product, this.color, required this.onItemTap});

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
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: context.widthPx, maxHeight: 200),
          child: viewType == ViewType.listView
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                        flex: 1,
                        child: ImageItem(imagePath: product.images[0])), //
                    const HSpace(10),
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(product.name,
                              style: TextStyles.h6
                                  .copyWith(fontWeight: FontWeight.w500)),
                          const VSpace(5),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(product.business,
                                  style: TextStyles.h7
                                      .copyWith(fontWeight: FontWeight.w700)),
                              const HSpace(5),
                              if (product.isStoreVerified) ...[
                                Image.asset(
                                  R.png.verified.imgPng,
                                )
                              ]
                            ],
                          ),
                          const VSpace(5),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                  MoneyInputFormatter().toCurrencyString(
                                      product.price.toString()),
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
                                    color: product.isStoreFavorite == true
                                        ? theme.redButton
                                        : null,
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
                    Expanded(
                      child: ImageItem(imagePath: product.images[0]),
                    ),
                    const VSpace(5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(product.name,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyles.h6
                                .copyWith(fontWeight: FontWeight.w500)),
                        const VSpace(9),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(product.business,
                                style: TextStyles.h7
                                    .copyWith(fontWeight: FontWeight.w700)),
                            const HSpace(5),
                            if (product.isStoreVerified) ...[
                              Image.asset(R.png.verified.imgPng)
                            ]
                          ],
                        ),
                        const VSpace(10),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                                MoneyInputFormatter()
                                    .toCurrencyString(product.price.toString()),
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
                                  R.png.heart.svg, //
                                  size: 15,

                                  color: product.isStoreFavorite == true
                                      ? theme.redButton
                                      : null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

class ImageItem extends StatelessWidget {
  const ImageItem({super.key, required this.imagePath, this.imageHeight = 109});

  final String imagePath;
  final double imageHeight;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: Corners.s5Border,
      child: SizedBox(
        height: imageHeight,
        child: Image.network(
          imagePath,
          errorBuilder: (context, obj, trac) => const Icon(Icons.image_sharp),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
