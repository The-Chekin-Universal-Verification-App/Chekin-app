import 'package:chekinapp/export.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../components/input/base_text_input.dart';
import '../../../../../core/models/business_signup_model.dart';

class EmailSection extends StatefulWidget {
  const EmailSection({Key? key, this.fieldRequired = true}) : super(key: key);
  final bool
      fieldRequired; // is am using this to set the required field to NOT Required during business profile update
  @override
  State<EmailSection> createState() => _EmailSectionState();
}

class _EmailSectionState extends State<EmailSection> {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    BusinessSignUpModel businessModel =
        context.select((AuthProvider provider) => provider.businessSignUpModel);

    return Column(
      children: [
        Row(
          children: [
            Text(
              context.loc.firstEmail,
              style: TextStyles.body1.copyWith(fontWeight: FontWeight.w900),
            ),
            Text(
              widget.fieldRequired ? '*' : '',
              style: TextStyles.h5.copyWith(
                  height: 1.5,
                  color: theme.redButton,
                  fontWeight: FontWeight.w900),
            )
          ],
        ),
        CustomFormTextField(
          onChange: (firstMail) {
            context.read<AuthProvider>().addToBusinessInfo =
                businessModel.copyWith(email1: firstMail);
          },
          hintText: R.S.emailExample,
          isRequired: widget.fieldRequired ? true : false,
        ),
        const VSpace(25),
        Row(
          children: [
            Text(
              context.loc.secondEmail,
              style: TextStyles.body1.copyWith(fontWeight: FontWeight.w900),
            ),
          ],
        ),
        VSpace(context.sp(5)),
        CustomFormTextField(
          onChange: (email2) {
            context.read<AuthProvider>().addToBusinessInfo =
                businessModel.copyWith(email2: email2);
          },
          hintText: R.S.emailExample,
          isRequired: false,
        ),
        const VSpace(50),
      ],
    );
  }
}
