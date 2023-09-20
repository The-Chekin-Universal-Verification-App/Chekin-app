import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../../res/language_and_emojis.dart';
import 'package:feather_icons/feather_icons.dart';

class DialogServices {
  static showLanguageCountry(BuildContext context) async {
    return showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      context: context,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        List<Language> languages = Language.languageList();

        return SimpleDialog(
          titlePadding: EdgeInsets.zero,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              constraints: BoxConstraints(maxHeight: context.heightPx * 0.4),
              child: ListView.builder(
                  itemCount: Language.languageList().length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              languages[index].flag,
                              style: const TextStyle(fontSize: 30),
                            ),
                            const HSpace(15),
                            Text(
                              " ${languages[index].name}",
                              style: TextStyles.h7,
                            ),
                          ],
                        ).clickable(() {
                          context
                              .read<AppProvider>()
                              .setLanguage(languages[index]);
                          // print(languages[index].languageCode);
                          context.pop();
                        }),
                      )),
            )
          ],
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }

  ///has no title
  static Future<Object?> emptyModalWithNoTitle(BuildContext context,
      {String? title,
      TextStyle? titleStyle,
      Widget? body,
      String? iconPath,
      bool showIcon = true,
      Color? bgColor,
      bool fromTop = true,
      bool autoPop = true,
      Duration? closeDuration,
      TransitionType transitionType = TransitionType.slide,
      double screenFraction = 0.4,
      double barrierColorOpacity = 0.4}) {
    bool dialogIsOpen = true;

    autoPop
        ? Future.delayed(closeDuration ?? const Duration(seconds: 3), () {
            if (dialogIsOpen == true) {
              Navigator.of(context, rootNavigator: true).pop();
            } else {
              null;
            }
          })
        : null;
    return showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.transparent.withOpacity(barrierColorOpacity),
      transitionDuration: const Duration(milliseconds: 620),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment:
              fromTop == true ? Alignment.topCenter : Alignment.bottomCenter,
          child: Container(
            constraints: const BoxConstraints(maxHeight: 400),
            margin: EdgeInsets.only(
                top: context.heightPx * screenFraction,
                left: Insets.m,
                right: Insets.m,
                bottom: 50),
            decoration: BoxDecoration(
              color: bgColor ?? Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Insets.l, vertical: 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    showIcon
                        ? Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.2),
                                child: iconPath == null
                                    ? SvgPicture.asset(R.png.bell.svg)
                                    : Image.asset(iconPath),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    const VSpace(8),
                    body ?? const SizedBox.shrink()
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (modalContext, anim1, anim2, child) {
        if (transitionType == TransitionType.fadeScale) {
          return FadeScaleTransition(
            animation: anim1,
            child: child,
          );
        } else if (transitionType == TransitionType.slide) {
          return SlideTransition(
            position: Tween(
                    begin: Offset(0, fromTop == true ? -1 : 1),
                    end: const Offset(0, 0))
                .animate(anim1),
            child: child,
          );
        } else {
          return SlideTransition(
            position: Tween(
                    begin: Offset(0, fromTop == true ? -1 : 1),
                    end: const Offset(0, 0))
                .animate(anim1),
            child: child,
          );
        }
      },
    ).then((value) {
      dialogIsOpen = false;
      // print(dialogIsOpen);
      return true;
    });
  }

  static Future<Object?> showNetworkExceptionModal(BuildContext context,
      {String? title,
      Widget? body,
      String? iconPath,
      double screenFraction = 0.4}) {
    bool fromTop = true;
    return showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment:
              fromTop == true ? Alignment.topCenter : Alignment.bottomCenter,
          child: Container(
            constraints: const BoxConstraints(maxHeight: 400, maxWidth: 270),
            margin: EdgeInsets.only(
                top: context.heightPx * screenFraction,
                left: Insets.l,
                right: Insets.l,
                bottom: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Insets.l, vertical: 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 20,
                        width: 40,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: const [
                            Positioned(
                              top: -60.0,
                              right: -8,
                              child: CircleAvatar(
                                  radius: 15.0,
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 20,
                        width: 40,
                        child: Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -21.0,
                              child: CircleAvatar(
                                radius: 21,
                                backgroundColor:
                                    const Color(0xffD9D9D9).withOpacity(0.4),
                                child: Icon(
                                  Icons.warning_amber_rounded,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    title == null ? const SizedBox.shrink() : const VSpace(10),
                    title == null
                        ? const SizedBox.shrink()
                        : Text(
                            title,
                            style: TextStyles.h6.copyWith(
                                fontWeight: FontWeight.w900,
                                color: Colors.grey),
                          ),
                    const VSpace(20),
                    body ?? const SizedBox.shrink(),
                    const VSpace(10),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
                  begin: Offset(0, fromTop == true ? -1 : 1),
                  end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }

  ///has no title
  static Future<Object?> messageModalFromTop(BuildContext context,
      {required String message,
      Widget? icon,
      Color? bgColor,
      bool fromTop = true,
      bool autoPop = true,
      NotificationType notificationType = NotificationType.success,
      Duration? closeDuration,
      double screenFraction = 0.08}) {
    bool dialogIsOpen = true;

    autoPop
        ? Future.delayed(closeDuration ?? const Duration(seconds: 6), () {
            if (dialogIsOpen == true) {
              Navigator.of(context, rootNavigator: true).pop();
            } else {
              null;
            }
          })
        : null;
    return showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.transparent.withOpacity(0.1),
      transitionDuration: const Duration(milliseconds: 990),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment:
              fromTop == true ? Alignment.topCenter : Alignment.bottomCenter,
          child: Container(
            constraints:
                BoxConstraints(maxHeight: 400, minWidth: context.widthPx * 0.8),
            margin: EdgeInsets.only(
                top: context.heightPx * screenFraction,
                left: Insets.m,
                right: Insets.m,
                bottom: 50),
            decoration: BoxDecoration(
              color: bgColor ??
                  (notificationType == NotificationType.success
                      ? Colors.green.shade500
                      : Colors.red.shade500),
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
                        child: icon ??
                            Icon(
                              notificationType == NotificationType.success
                                  ? FeatherIcons.smile
                                  : FeatherIcons.frown,
                              color: Colors.grey.shade300.withOpacity(0.4),
                              size: 40,
                            ),
                      ),
                    ),
                    Text(
                      message,
                      style: TextStyles.h7.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (modalContext, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
                  begin: Offset(0, fromTop == true ? -1 : 1),
                  end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    ).then((value) {
      dialogIsOpen = false;
      // print(dialogIsOpen);
      return true;
    });
  }
}

enum NotificationType { success, error }

enum TransitionType { fade, fadeScale, slide, scale }
