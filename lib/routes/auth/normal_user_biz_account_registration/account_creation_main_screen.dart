import 'package:chekinapp/routes/auth/normal_user_biz_account_registration/user_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';
import '../country_picker_screen.dart';
import '../password_screen.dart';
import '../phone_number_registration.dart';
import 'biz_account/biz_account_creation_main_screen.dart';
import 'email_form_page_screen.dart';

class AccountCreationScreen extends StatelessWidget {
  const AccountCreationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    int pageIndex =
        context.select((AuthProvider provider) => provider.signUpPageIndex);
    return Scaffold(
        appBar: CustomAppBar(
          leading: true,
          onTapLeadingIcon: () {
            if (pageIndex > 0) {
              context.read<AuthProvider>().setSignUpPageIndex =
                  (pageIndex > 0 ? pageIndex - 1 : 0);
            } else {
              context.pop();
            }
          },
          titleWidget: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 30),
            child: const LogoIconItem(allRoundPadding: 1),
          ),
          trailing: [
            UnconstrainedBox(
              child: CustomContainer(
                height: 30,
                width: 30,
                padding: const EdgeInsets.all(5),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: theme.primary,
                ),
                child: CircleAvatar(
                  backgroundColor: theme.black,
                  child: const Icon(
                    Icons.question_mark_rounded,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const HSpace(20)
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              PageIndexIndicatorItem(
                pageIndex: pageIndex,

                ///the number passed down with be a figure directly coming from a Provider class which can be watch and updated accordingly
                ///
                onTapIndicator: (index) {
                  context.read<AuthProvider>().setSignUpPageIndex = index!; //
                },
                itemCounts: 5,
              ),
              IndexedStack(
                index: pageIndex,
                children: const [
                  PhoneNumberRegistrationWidget(),
                  UserDetailView(),
                  PasswordScreen(),
                  CountryPickerScreen(),
                  EmailEntryScreen(),
                ],
              ),
            ],
          ),
        ));
  }
}
