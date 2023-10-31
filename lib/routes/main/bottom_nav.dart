import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    List<Map<String, dynamic>> items = Mock.navItems;
    return Consumer<MainProvider>(
      builder: (context, store, child) {
        return Container(
          height: 65,
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 3),
          margin: const EdgeInsets.only(bottom: 0.5),
          decoration: BoxDecoration(
              color: theme.background,
              boxShadow: Shadows.universal,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12), topLeft: Radius.circular(12))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(
                items.length,
                (index) => _NavItem(
                  icon: items[index]['icon'],
                  title: items[index]['label'],
                  isSelected: store.navIndex == index,
                  onPressed: () => store.setNavIndex = index,
                  iconColor: store.navIndex == 0
                      ? theme.primary
                      : store.navIndex == 1
                          ? theme.greenButton
                          : store.navIndex == 2
                              ? theme.redButton
                              : store.navIndex == 3
                                  ? theme.black
                                  : theme.grey.withOpacity(.4),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem(
      {Key? key,
      required this.icon,
      required this.title,
      required this.isSelected,
      this.iconColor,
      this.onPressed})
      : super(key: key);
  final String icon;
  final String title;
  final bool isSelected;
  final VoidCallback? onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset(
                    icon,
                    color: isSelected
                        ? (iconColor ?? theme.primary)
                        : theme.grey.withOpacity(.4),

                    // colorFilter: ColorFilter.mode(
                    //     isSelected ? theme.primary : theme.grey.withOpacity(.4),
                    //     BlendMode.darken),
                  )),
              // const VSpace(5),
              // Text(
              //   title,
              //   style: TextStyles.body3
              //       .txtColor(
              //           isSelected ? theme.primary : theme.grey.withOpacity(.4))
              //       .semiBold,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
