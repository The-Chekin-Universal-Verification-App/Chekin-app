import 'dart:ui';

import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet {
  static Future openBottomSheet(BuildContext context, Widget child,
      {double sizeFraction = 0.45,
      String title = '',
      bool addCloseIcon = false,
      bool showDragTopICon = true,
      bool centerAlignTitle = true,
      bool isDismissible = true,
      bool enableDrag = true,
      double edgeRadius = 10,
      double closeIconHeightFromTop = 5,
      EdgeInsets? padding}) {
    return showMaterialModalBottomSheet(
        context: context,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent.withOpacity(0.15),
        builder: (
          BuildContext context,
        ) =>
            CustomContainer(
              height: context.heightPx * sizeFraction,
              color: Theme.of(context).scaffoldBackgroundColor,
              shadows: Shadows.universal,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(edgeRadius),
                  topRight: Radius.circular(edgeRadius)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showDragTopICon) ...[
                    CustomContainer(
                      width: 50,
                      height: 5,
                      margin: const EdgeInsets.only(top: 10),
                      borderRadius: Corners.s8Border,
                      color: Colors.black.withOpacity(0.2),
                    ).center()
                  ],
                  VSpace(closeIconHeightFromTop),
                  addCloseIcon
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (centerAlignTitle) ...[const SizedBox()],

                              Container(
                                child: Text(
                                  title,
                                  style: TextStyles.body3
                                      .copyWith(fontWeight: FontWeight.w600),
                                ).center(),
                              ),
                              // const Spacer(),
                              const Icon(Icons.close).rippleClick(() {
                                context.pop();
                              })
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                  const VSpace(10),
                  Expanded(
                    child: Padding(
                      padding:
                          padding ?? const EdgeInsets.symmetric(horizontal: 24),
                      child: child,
                    ),
                  )
                ],
              ),
            ));
  }

  static Future<Future<bool>?> showCustomBottomSheet(Widget child,
      {double sizeFraction = 0.45,
      String title = '',
      bool addCloseIcon = false,
      bool showDragIcon = true,
      Function()? onTapCloseIcon,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    PersistentBottomSheetController? sheetController;

    sheetController = scaffoldKey.currentState?.showBottomSheet(
        enableDrag: true,
        // backgroundColor: Colors.transparent.withOpacity(0.4),
        (context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              blendMode: BlendMode.darken,
              child: CustomContainer(
                height: context.heightPx * sizeFraction,
                color: Theme.of(context).scaffoldBackgroundColor,
                shadows: Shadows.universal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: showDragIcon,
                      child: CustomContainer(
                        width: 50,
                        height: 5,
                        margin: const EdgeInsets.only(top: 10),
                        borderRadius: Corners.s8Border,
                        color: Colors.black.withOpacity(0.2),
                      ).center(),
                    ),
                    const VSpace(5),
                    addCloseIcon
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              // const Spacer(),
                              Container(
                                margin: const EdgeInsets.only(left: 30),
                                child: Text(
                                  title,
                                  style: TextStyles.body2
                                      .copyWith(fontWeight: FontWeight.w600),
                                ).center(),
                              ),
                              // const Spacer(),
                              const Icon(Icons.close)
                                  .rippleClick(onTapCloseIcon ??
                                      () {
                                        context.pop();
                                      })
                            ],
                          )
                        : const SizedBox.shrink(),
                    const VSpace(10),
                    Expanded(child: child)
                  ],
                ),
              ),
            ));
    return sheetController?.closed.then((value) => value);
  }

  static showBottomSheetWithNoScaffoldKey(
    BuildContext context,
    Widget child, {
    double sizeFraction = 0.45,
    String title = '',
    bool addCloseIcon = false,
    bool addDragIcon = false,
  }) {
    showBottomSheet(
        context: context,
        builder: (BuildContext context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: CustomContainer(
                height: context.heightPx * sizeFraction,
                color: Theme.of(context).scaffoldBackgroundColor,
                shadows: Shadows.universal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: addDragIcon,
                      child: CustomContainer(
                        width: 50,
                        height: 5,
                        margin: const EdgeInsets.only(top: 10),
                        borderRadius: Corners.s8Border,
                        color: Colors.black.withOpacity(0.2),
                      ).center(),
                    ),
                    const VSpace(5),
                    addCloseIcon
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              Container(
                                margin: const EdgeInsets.only(left: 30),
                                child: Text(
                                  title,
                                  style: TextStyles.body2
                                      .copyWith(fontWeight: FontWeight.w600),
                                ).center(),
                              ),
                              const Icon(Icons.close).rippleClick(() {
                                context.pop();
                              })
                            ],
                          )
                        : const SizedBox.shrink(),
                    const VSpace(10),
                    Expanded(child: child)
                  ],
                ),
              ),
            ));
  }
}
