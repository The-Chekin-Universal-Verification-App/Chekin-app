import 'package:chekinapp/core/commands/product_command.dart';
import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';

import '../../components/input/base_text_input.dart';
import '../../components/msc/loader_state_widget.dart';
import '../../core/commands/business_command.dart';
import '../../core/providers/product_provider.dart';
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
          body: const ProductViewSection(),
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
    List<ProductModel> product =
        context.select((ProductProvider product) => product.products);
    return LoaderStateItem(
        key: UniqueKey(),
        onRefreshNoData: () async {
          await ProductCommand(context).getProducts();
        },
        isLoading: false,
        item: product,
        widgetOnLoadSuccess: RefreshIndicator(
          onRefresh: () async {
            await ProductCommand(context).getProducts();
          },
          child: viewType == ViewType.listView
              ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: product.length,
                  itemBuilder: (BuildContext context, index) => DiscoverItem(
                    product: product[index],
                    onItemTap: () {
                      //select a product
                      context.read<DiscoverProvider>().selectAProduct =
                          product[index];
                      context.push(const ProductReviewScreen());

                      BusinessCommand(context).getBusinessReviews(
                          businessId: product[index]
                              .business); // this get the review on business
                    },
                  ),
                )
              : GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: product.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 15,
                      childAspectRatio: 0.7),
                  itemBuilder: (BuildContext context, index) => DiscoverItem(
                        product: product[index],
                        onItemTap: () {
                          //select a product
                          context.read<DiscoverProvider>().selectAProduct =
                              product[index];
                          context.push(const ProductReviewScreen());

                          BusinessCommand(context).getBusinessReviews(
                              businessId: product[index]
                                  .business); // this get the review on business
                        },
                      )),
        ));
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
