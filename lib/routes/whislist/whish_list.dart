import 'package:chekinapp/core/commands/product_command.dart';
import 'package:chekinapp/export.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../../components/msc/loader_state_widget.dart';
import '../discover/discover_components/discover_item.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Color(0xFCF9BFC9),
      Color(0xffCCE4FF),
      Color(0xffD4FFE8),
    ];

    WishListProvider wishList = context.watch<WishListProvider>();

    bool state = context.select((HomeProvider provider) => provider.isBusy);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // print(myNewWishList.hashCode); //
    //   // myNewWishList.isEmpty
    //   //     ? showBottomSheet(
    //   //         context: context,
    //   //         builder: (BuildContext context) => Container(
    //   //               decoration: BoxDecoration(
    //   //                   borderRadius: Corners.s8Border,
    //   //                   color: theme.background,
    //   //                   boxShadow: Shadows.universal),
    //   //               child: SizedBox(
    //   //                 height: 60,
    //   //                 width: context.widthPx * 0.8,
    //   //                 child: Column(
    //   //                   children: [
    //   //                     Text(
    //   //                       'data',
    //   //                       style: TextStyles.body1,
    //   //                     )
    //   //                   ],
    //   //                 ),
    //   //               ),
    //   //             ))
    //   //     : null;
    // });
    // print(wishList.myWishList); //
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.l),
          child: Column(
            children: [
              const VSpace(20),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.loc.wishlist,
                          style: TextStyles.h4.copyWith(fontSize: 32),
                        )
                      ],
                    ),
                    const VSpace(5),
                    Text(
                      context.loc.keepItemInWishlist,
                      style: TextStyles.body1,
                    ),
                  ],
                ),
              ),
              const VSpace(20),
              Expanded(
                  child: LoaderStateItem(
                key: UniqueKey(),
                isLoading: state,
                item: wishList.myWishList,
                onListEmptyWidget: const EmptyListWidget(),
                widgetOnLoadSuccess: ListView.builder(
                  key: UniqueKey(),
                  physics: const BouncingScrollPhysics(),
                  itemCount: wishList.myWishList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (_, index) => Dismissible(
                    key: Key(wishList.myWishList[index].id),
                    background: Container(color: Colors.red.withOpacity(0.5)),
                    onDismissed: (dismissed) {
                      // wishList.removeFromWishList(wishList.myWishList[index]);
                      ProductCommand(context)
                          .removeFromWishList(wishList.myWishList[index].id);
                    },
                    child: SizedBox(
                      width: context.widthPx,
                      child: DiscoverItem(
                        product: wishList.myWishList[index],
                        onItemTap: () {},
                        isAWishListItem: true,
                        color: const Color(0xff6F7E38),
                        onMenuSelected: (SampleItem item) {
                          ProductCommand(context).removeFromWishList(
                              wishList.myWishList[index].id);
                        },
                      ),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class MySnackBar {
  const MySnackBar({required this.context});
  final BuildContext context;

  showSnackBar({String? message, Color color = Colors.green}) {
    BuildContext? contxt = R.N.nav?.context ?? context;
    ScaffoldMessenger.of(contxt).showSnackBar(SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          constraints:
              BoxConstraints(maxHeight: 400, minWidth: context.widthPx * 0.8),
          margin: EdgeInsets.only(
              // top: context.heightPx * screenFraction,
              left: Insets.m,
              right: Insets.m,
              bottom: 50),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: Insets.l, vertical: 20.0),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.centerLeft,
                children: [
                  Positioned(
                    left: -25,
                    child: Transform.rotate(
                      angle: 0.8,
                      child: Icon(
                        FeatherIcons.smile,
                        color: Colors.grey.shade300.withOpacity(0.4),
                        size: 40,
                      ),
                    ),
                  ),
                  Text(message ?? 'Item removed from your wishlist',
                      style: TextStyles.h7.copyWith(color: Colors.white))
                ],
              ),
            ),
          ),
        )));
  }
}
