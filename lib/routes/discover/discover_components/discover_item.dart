import 'package:chekinapp/core/commands/product_command.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../discover_screen.dart';

class DiscoverItem extends StatefulWidget {
  const DiscoverItem({
    super.key,
    required this.product,
    this.color,
    required this.onItemTap,
    this.isAWishListItem = false,
    required this.onMenuSelected,
  });

  final ProductModel product;
  final Color? color;
  final bool isAWishListItem;
  final Function() onItemTap;
  final Function(SampleItem item) onMenuSelected;

  @override
  State<DiscoverItem> createState() => _DiscoverItemState();
}

class _DiscoverItemState extends State<DiscoverItem> {
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    ViewType viewType =
        context.select((DiscoverProvider provider) => provider.viewType);
    List<ProductModel> myWishList =
        context.select((WishListProvider provider) => provider.myWishList);
    AppTheme theme = context.watch();
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ColorBox(
        color: widget.color ?? theme.primary,
        onTap: widget.onItemTap,
        padding: const EdgeInsets.all(0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: context.widthPx,
              maxHeight: viewType == ViewType.listView ? 130 : 200),
          child: viewType == ViewType.listView
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      flex: 1,
                      child: ImageItem(
                          imageHeight: context.heightPx,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                          imagePath: widget.product.images.first),
                    ), //
                    const HSpace(10),
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Text(widget.product.name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.h6
                                        .copyWith(fontWeight: FontWeight.w500)),
                              ),
                              Theme(
                                data: Theme.of(context).copyWith(
                                  highlightColor:
                                      Colors.transparent.withOpacity(0.02),
                                ),
                                child: PopupMenuButton<SampleItem>(
                                  shadowColor:
                                      Colors.transparent.withOpacity(0.02),
                                  initialValue: selectedMenu,
                                  // Callback that sets the selected popup menu item.
                                  onSelected: (item) {
                                    widget.onMenuSelected(item);

                                    setState(() {
                                      selectedMenu = item;
                                    });
                                  },
                                  itemBuilder: (BuildContext context) =>
                                      <PopupMenuEntry<SampleItem>>[
                                    if (myWishList
                                        .contains(widget.product)) ...[
                                      const PopupMenuItem<SampleItem>(
                                        value: SampleItem.removeFromList,
                                        child: Text('Remove from wishlist'),
                                      )
                                    ],
                                    if (!widget.isAWishListItem &&
                                        !myWishList
                                            .contains(widget.product)) ...[
                                      const PopupMenuItem<SampleItem>(
                                        value: SampleItem.addToList,
                                        child: Text('Add to wishlist'),
                                      ),
                                    ]
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const VSpace(5),
                          Row(
                            // crossAxisAlignment: WrapCrossAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Text(widget.product.business!.name,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.h7
                                        .copyWith(fontWeight: FontWeight.w700)),
                              ),
                              const HSpace(5),
                              if (widget.product.business!.verified) ...[
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
                                  "NGN${MoneyInputFormatter().toCurrencyString(widget.product.price.toString())}",
                                  style: TextStyles.h7
                                      .copyWith(fontWeight: FontWeight.w500)),
                              const HSpace(3),
                              FavButton(product: widget.product)
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ImageItem(
                          // imageHeight: 200,
                          minWidth: context.widthPx,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                          imagePath: widget.product.images[0]),
                    ),
                    const VSpace(5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.product.name,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyles.h6
                                .copyWith(fontWeight: FontWeight.w500)),
                        const VSpace(2),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(widget.product.business!.name,
                                style: TextStyles.h7
                                    .copyWith(fontWeight: FontWeight.w700)),
                            const HSpace(5),
                            if (widget.product.business!.verified) ...[
                              Image.asset(R.png.verified.imgPng)
                            ]
                          ],
                        ),
                        const VSpace(5),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                                "NGN${MoneyInputFormatter().toCurrencyString(widget.product.price.toString())}",
                                style: TextStyles.h7
                                    .copyWith(fontWeight: FontWeight.w500)),
                            const HSpace(8),
                            FavButton(product: widget.product)
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

// This is the type used by the popup menu below.
enum SampleItem { removeFromList, addToList }

class FavButton extends StatefulWidget {
  const FavButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200),
        reverseDuration: const Duration(milliseconds: 600),
        lowerBound: 0.0,
        upperBound: 0.5)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
  }

  @override
  dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool addToWishListIsBusy = false;

  addToServer(List<String> myNewWishListIds) {
    List<String> ids = myNewWishListIds;
    Future.delayed(const Duration(seconds: 6), () {
      // print('happening at 6sec');
      ProductCommand(context).addToWishList(ids);
      addToWishListIsBusy = false;
      // print(addToWishListIsBusy);
    });
  }

  @override
  Widget build(BuildContext context) {
    double scale = 1 - _controller.value;
    List<ProductModel> myWishList =
        context.select((WishListProvider provider) => provider.myWishList);
    List<String> myNewWishListIds = context.select(
        (WishListProvider provider) => provider.pickedWishListProductIds);
    AppTheme theme = context.watch();
    return CircleAvatar(
      //
      radius: 25,
      backgroundColor: Colors.transparent,
      child: GestureDetector(
          onTap: () {
            _controller.forward();

            if (myWishList.contains(widget.product)) {
              log('I am already wish Listed');
              // context
              //     .read<WishListProvider>()
              //     .removeFromWishList(widget.product);
            } else {
              log('Wait wish Listing...');
              //add the item to the wish list
              context.read<WishListProvider>().addToWishList(widget.product);

              //check if the add to server is called already if not call the below function to add [or POST ]  what is on the list to server
              if (addToWishListIsBusy == false) {
                addToServer(myNewWishListIds);
                setState(() {
                  addToWishListIsBusy = true;
                });
                context.read<WishListProvider>().clearIDsWishList();
              } else {
                null;
              }
            }
          },
          child: AnimatedScale(
            duration: const Duration(milliseconds: 100),
            scale: scale,
            child: CustomContainer(
              height: 21.0,
              width: 21.0,
              borderRadius: Corners.s5Border,
              color: theme.primary.withOpacity(0.15),
              child: Center(
                child: SvgIcon(
                  R.png.heart2.svg,
                  size: 15,
                  color: widget.product.isStoreFavorite == true ||
                          myWishList.contains(widget.product)
                      ? theme.redButton
                      : null,
                ),
              ),
            ),
          )),
    );
  }
}

class ImageItem extends StatelessWidget {
  const ImageItem(
      {super.key,
      required this.imagePath,
      this.imageHeight = 109,
      this.minWidth = 150,
      this.borderRadius});

  final String imagePath;
  final double imageHeight, minWidth;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? Corners.s5Border,
      child: Container(
        height: imageHeight,
        constraints: BoxConstraints(minWidth: minWidth),
        child: Image.network(
          imagePath,
          errorBuilder: (context, obj, trac) => const Icon(
            Icons.image_outlined,
            size: 45,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
