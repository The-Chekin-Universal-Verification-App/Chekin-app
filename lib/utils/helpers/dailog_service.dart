import 'package:flutter/material.dart';
import 'package:chekinapp/core/providers/app_provider.dart';
import 'package:chekinapp/export.dart';

import '../../res/language_and_emojis.dart';

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
}
