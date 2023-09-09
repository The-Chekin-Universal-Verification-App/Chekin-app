import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';

import '../../components/msc/loader_state_widget.dart';
import '../discover/discover_components/discover_item.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    // List<String> wishList = [''];
    List<Color> colors = [
      Color(0xFCF9BFC9),
      Color(0xffCCE4FF),
      Color(0xffD4FFE8),
    ];
    List<ProductModel> wishList =
        context.select((WishListProvider provider) => provider.wishList);
    bool state = context.select((HomeProvider provider) => provider.isBusy);
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
                        ),
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
                item: wishList,
                onListEmptyWidget: const EmptyListWidget(),
                widgetOnLoadSuccess: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: wishList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, index) => Column(
                          ///i used row to cancel out the constrain on the child widget by listview builder widget
                          children: [
                            DiscoverItem(
                              product: ProductModel(
                                  images: [R.png.laptop.imgPng],
                                  name: 'Apple MacBook Pro',
                                  business: 'Apple Store',
                                  isStoreVerified:
                                      index == wishList.length ~/ 2 ||
                                              index == wishList.length ~/ 3
                                          ? true
                                          : false,
                                  isStoreFavorite:
                                      index == wishList.length ~/ 3 ||
                                              index == wishList.length ~/ 3
                                          ? true
                                          : false,
                                  info: R.S.productInfo),
                              onItemTap: () {},
                              color: const Color(0xff6F7E38),
                            ),
                          ],
                        )),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
