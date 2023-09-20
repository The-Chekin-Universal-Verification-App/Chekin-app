import 'package:chekinapp/export.dart';
import 'package:chekinapp/routes/discover/discover_components/discover_item.dart';
import 'package:flutter/material.dart';

import '../../components/input/base_text_input.dart';
import '../../core/models/business_model.dart';
import '../../core/providers/business_provider.dart';
import '../discover/discover_components/sorting_item.dart';
import '../discover/discover_screen.dart';
import '../reviews/business_review_screen.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  DiscoverSortType? sortType;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    ViewType viewType =
        context.select((DiscoverProvider provider) => provider.viewType);
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Insets.l),
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, s) => [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Text(
                          context.loc.businesses,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.h3.copyWith(fontSize: 36),
                        ),
                      ),
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
          body: const BusinessViewSection(),
        ),
      ),
    );
  }
}

class BusinessViewSection extends StatelessWidget {
  const BusinessViewSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ViewType viewType =
        context.select((DiscoverProvider provider) => provider.viewType);
    List<BusinessModel> businesses = context
        .select((BusinessProvider business) => business.allAvailableBusiness);

    return viewType == ViewType.listView
        ? ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: businesses.length,
            itemBuilder: (BuildContext context, index) => BusinessItem(
              businessObject: businesses[index],
              onItemTap: () {
                context.read<BusinessProvider>().selectABusiness =
                    businesses[index];
                context.push(const BusinessReviewScreen());
              },
            ),
          )
        : GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: businesses.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 15,
                childAspectRatio: 0.7),
            itemBuilder: (BuildContext context, index) => BusinessItem(
                  businessObject: businesses[index],
                  onItemTap: () {
                    context.read<BusinessProvider>().selectABusiness =
                        businesses[index];
                    context.push(const BusinessReviewScreen());
                  },
                ));
  }
}

class BusinessItem extends StatelessWidget {
  const BusinessItem(
      {super.key,
      required this.businessObject,
      this.color,
      required this.onItemTap});

  final BusinessModel businessObject;
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
                        child: ImageItem(
                            imagePath: businessObject.businessImage)), //
                    const HSpace(10),
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(businessObject.owner,
                              style: TextStyles.h6
                                  .copyWith(fontWeight: FontWeight.w500)),
                          const VSpace(5),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(businessObject.name,
                                  style: TextStyles.h7
                                      .copyWith(fontWeight: FontWeight.w700)),
                              const HSpace(5),
                              if (businessObject.verified) ...[
                                Image.asset(
                                  R.png.verified.imgPng,
                                )
                              ]
                            ],
                          ),
                          const VSpace(5),
                        ],
                      ),
                    )
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ImageItem(imagePath: businessObject.businessImage),
                    ),
                    const VSpace(5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(businessObject.owner,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyles.h6
                                .copyWith(fontWeight: FontWeight.w500)),
                        const VSpace(9),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(businessObject.name,
                                style: TextStyles.h7
                                    .copyWith(fontWeight: FontWeight.w700)),
                            const HSpace(5),
                            if (businessObject.verified) ...[
                              Image.asset(R.png.verified.imgPng)
                            ]
                          ],
                        ),
                        const VSpace(10),
                      ],
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
