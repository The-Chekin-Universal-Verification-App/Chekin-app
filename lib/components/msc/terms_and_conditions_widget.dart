import 'package:flutter/cupertino.dart';
import 'package:lookapp/export.dart';


class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Wrap(
          runSpacing: 4,
          alignment: WrapAlignment.center,
          children: [
            Text(
              context.loc.byClickingTerm,
              style: TextStyles.body2.copyWith(color: theme.txt, fontSize: 13),
            ),
            Text(context.loc.termsOfService,
                style: TextStyles.body2
                    .copyWith(color: theme.primary, fontSize: 13)),
            Text(context.loc.and,
                style:
                TextStyles.body2.copyWith(color: theme.txt, fontSize: 13)),
            Text(context.loc.privacyPolicy,
                style: TextStyles.body2
                    .copyWith(color: theme.primary, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
