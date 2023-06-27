import 'package:flutter/cupertino.dart';
import 'package:lookapp/export.dart';

import '../../core/providers/app_provider.dart';
import '../../res/language_and_emojis.dart';

class SelectLanguageWidget extends StatelessWidget {
  const SelectLanguageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    Language language =
        context.select((AppProvider appProvider) => appProvider.language);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: UnconstrainedBox(
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              borderRadius: Corners.s16Border,
              border: Border.all(color: theme.primary)),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SizedBox(
                  height: 18,
                  width: 18,
                  child: SvgPicture.asset(R.png.languageIcon.svg)),
              const HSpace(3),
              Text(
                language.name,
                style: TextStyles.body1
                    .copyWith(color: theme.black, fontWeight: FontWeight.w500),
              ),
            ],
          ).rippleClick(
            () {
              DialogServices.showLanguageCountry(context);
            },
          ),
        ),
      ),
    );
  }
}
