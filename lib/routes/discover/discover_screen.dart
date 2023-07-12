import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';

import '../../components/input/base_text_input.dart';
import '../reviews/review_screen.dart';
import 'discover_components/discover_item.dart';
import 'discover_components/sorting_item.dart';

enum ViewType { gridView, listView }

enum DiscoverSortType { fashion, automobile, sport, electronics }

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  DiscoverSortType? sortType;
  // ViewType viewType = ViewType.gridView;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    ViewType viewType =
        context.select((DiscoverProvider provider) => provider.viewType);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Insets.l),
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, s) => [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const VSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Text(
                          context.loc.discover,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.h3.copyWith(fontSize: 36),
                        ),
                      ),
                      Wrap(
                        children: [
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
                          const HSpace(20),
                          CustomContainer(
                            height: 40,
                            width: 40,
                            // padding: EdgeInsets.all(5),
                            borderRadius: Corners.s5Border,
                            color: theme.primary.withOpacity(0.15),
                            child: Center(
                              child: SvgIcon(
                                R.png.menuOutline.svg,
                                size: context.sp(20),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const VSpace(15),
                  Text(context.loc.discoverNote,
                      textAlign: TextAlign.start,
                      style: TextStyles.body1.copyWith(color: theme.greyText)),
                  const VSpace(30),
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: CustomFormTextFieldWithBorder(
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
                      ),
                      const HSpace(20),
                      SvgIcon(
                        viewType == ViewType.gridView
                            ? R.png.menuListview.svg
                            : R.png.menuGrid.svg,
                        size: 25,
                      ).clickable(() {
                        context.read<DiscoverProvider>().toggleViewTpe();
                      }),
                    ],
                  ),
                  const VSpace(20),
                  SizedBox(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SortingItem(
                          onTap: () {
                            sortType = DiscoverSortType.fashion;
                            setState(() {});
                          },
                          label: context.loc.fashion,
                          color: sortType == DiscoverSortType.fashion
                              ? theme.primary
                              : null,
                        ),
                        SortingItem(
                          onTap: () {
                            sortType = DiscoverSortType.sport;
                            setState(() {});
                          },
                          label: context.loc.sport,
                          color: sortType == DiscoverSortType.sport
                              ? theme.primary
                              : null,
                        ),
                        SortingItem(
                          onTap: () {
                            sortType = DiscoverSortType.electronics;
                            setState(() {});
                          },
                          label: context.loc.electronics,
                          color: sortType == DiscoverSortType.electronics
                              ? theme.primary
                              : null,
                        ),
                        SortingItem(
                          onTap: () {
                            sortType = DiscoverSortType.automobile;
                            setState(() {});
                          },
                          label: context.loc.autoMobile,
                          color: sortType == DiscoverSortType.automobile
                              ? theme.primary
                              : null,
                        ),
                      ],
                    ),
                  ),

                  ///sorting items list
                  const VSpace(20),
                ],
              ),
            )
          ],
          body: ProductViewSection(),
        ),
      ),
    );
  }
}

class ProductViewSection extends StatelessWidget {
  const ProductViewSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ViewType viewType =
        context.select((DiscoverProvider provider) => provider.viewType);

    return viewType == ViewType.listView
        ? ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              DiscoverItem(
                product: ProductModel(
                    productImage: R.png.iphone.imgPng,
                    itemName: 'iPhone 14 Pro Max',
                    storeName: 'Apple Store',
                    desc: R.S.productInfo),
                onItemTap: () {
                  context.read<DiscoverProvider>().selectAProduct =
                      ProductModel(
                          productImage: R.png.iphone.imgPng,
                          itemName: 'iPhone 14 Pro Max',
                          storeName: 'Apple Store',
                          desc: R.S.productInfo);
                  context.push(const ReviewScreen());
                },
              ),
              DiscoverItem(
                product: ProductModel(
                    productImage: R.png.laptop.imgPng,
                    itemName: 'Apple MacBook Pro',
                    storeName: 'Apple Store',
                    desc: R.S.productInfo),
                onItemTap: () {
                  context.read<DiscoverProvider>().selectAProduct =
                      ProductModel(
                          productImage: R.png.laptop.imgPng,
                          itemName: 'Apple MacBook Pro',
                          storeName: 'Apple Store',
                          desc: R.S.productInfo);
                  context.push(const ReviewScreen());
                },
                color: const Color(0xff6F7E38),
              ),
              DiscoverItem(
                product: ProductModel(
                    productImage: R.png.galaxyS20.imgPng,
                    itemName: 'Samsung S20',
                    storeName: 'Samsung Store',
                    desc: R.S.productInfo),
                onItemTap: () {},
                color: const Color(0xffFF6F7E),
              ),
            ],
          )
        : GridView(
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 15,
                childAspectRatio: 0.7),
            children: [
              DiscoverItem(
                product: ProductModel(
                    productImage: R.png.iphone.imgPng,
                    itemName: 'iPhone 14 Pro Max',
                    storeName: 'Apple Store',
                    desc: R.S.productInfo),
                onItemTap: () {
                  context.read<DiscoverProvider>().selectAProduct =
                      ProductModel(
                          productImage: R.png.iphone.imgPng,
                          itemName: 'iPhone 14 Pro Max',
                          storeName: 'Apple Store',
                          desc: R.S.productInfo);
                  context.push(const ReviewScreen());
                },
              ),
              DiscoverItem(
                product: ProductModel(
                    productImage: R.png.laptop.imgPng,
                    itemName: 'Apple MacBook Pro',
                    storeName: 'Apple Store',
                    desc: R.S.productInfo),
                onItemTap: () {
                  context.read<DiscoverProvider>().selectAProduct =
                      ProductModel(
                          productImage: R.png.laptop.imgPng,
                          itemName: 'Apple MacBook Pro',
                          storeName: 'Apple Store',
                          desc: R.S.productInfo);
                  context.push(const ReviewScreen());
                },
                color: const Color(0xff6F7E38),
              ),
              DiscoverItem(
                product: ProductModel(
                    productImage: R.png.galaxyS20.imgPng,
                    itemName: 'Samsung S20',
                    storeName: 'Samsung Store',
                    desc: R.S.productInfo),
                onItemTap: () {},
                color: const Color(0xffFF6F7E),
              ),
            ],
          );
  }
}

class DiscoverProvider extends BaseProvider {
  ViewType _viewType = ViewType.listView;

  ViewType get viewType => _viewType;

  toggleViewTpe() {
    if (_viewType == ViewType.listView) {
      _viewType = ViewType.gridView;
    } else {
      _viewType = ViewType.listView;
    }
    notifyListeners();
  }

  ProductModel _selectedProduct = ProductModel.init();

  ProductModel get selectedProduct => _selectedProduct;

  set selectAProduct(ProductModel product) {
    _selectedProduct = product;
    notifyListeners();
  }
}
