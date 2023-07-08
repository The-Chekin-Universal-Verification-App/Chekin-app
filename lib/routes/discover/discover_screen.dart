import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';

import '../../components/input/base_text_input.dart';

enum ViewType { gridView, listView }

enum DiscoverSortType { fashion, automobile, sport, electronics }

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  late DiscoverSortType sortType;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Insets.l),
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
                    ),
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
                  R.png.menuGrid.svg,
                  size: 25,
                )
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
            const VSpace(20),
            ColorBox(
              color: theme.primary,
              onTap: () {},
              child: Row(
                children: [
                  SizedBox(
                      height: 109, child: Image.asset(R.png.iphone.imgPng)),
                  Flexible(
                      child: Column(
                    children: [],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorBox extends StatelessWidget {
  const ColorBox(
      {super.key, this.color, required this.onTap, required this.child});
  final Color? color;
  final Widget child;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: Corners.s8Border,
          color: color?.withOpacity(.15),
        ),
        child: child.clickable(onTap),
      ),
    );
  }
}

class SortingItem extends StatelessWidget {
  const SortingItem(
      {super.key, this.color, required this.onTap, required this.label});
  final Color? color;
  final String label;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: CustomContainer(
          padding: const EdgeInsets.all(15),
          borderRadius: Corners.s8Border,
          color: color?.withOpacity(.9) ?? Colors.transparent,
          border: Border.all(
              color: Theme.of(context).primaryColor.withOpacity(0.5)),
          child: Text(
            label,
            style: TextStyles.body1.copyWith(
                fontWeight: FontWeight.w500,
                color: color != null ? Colors.white : Colors.black),
          ),
        ).rippleClick(onTap, padding: EdgeInsets.zero),
      ),
    );
  }
}
