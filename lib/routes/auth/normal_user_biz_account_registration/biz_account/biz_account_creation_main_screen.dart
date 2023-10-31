import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../../password_screen.dart';
import '../../phone_number_registration.dart';
import 'biz_info_details.dart';
import 'biz_owner_personal_detaills.dart';
import 'components/biz_contact_info.dart';

class BusinessAccountCreationMainScreen extends StatelessWidget {
  const BusinessAccountCreationMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    int pageIndex = context
        .select((AuthProvider provider) => provider.businessSignUpPageIndex);

    return Scaffold(
        appBar: CustomAppBar(
          leading: true,
          onTapLeadingIcon: () {
            if (pageIndex > 0) {
              context.read<AuthProvider>().setBusinessSignUpPageIndex =
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
                  context.read<AuthProvider>().setBusinessSignUpPageIndex =
                      index!; //
                },
                itemCounts: 5,
              ),
              IndexedStack(
                index: pageIndex,
                children: const [
                  PhoneNumberRegistrationWidget(),
                  BusinessOwnerDetailScreen(),
                  PasswordScreen(),
                  BusinessInfoDetailScreen(),
                  BusinessContactInfoScreen(),
                ],
              ),
            ],
          ),
        ));
  }
}

class PageIndexIndicatorItem extends StatelessWidget {
  const PageIndexIndicatorItem({
    super.key,
    required this.pageIndex,
    this.onTapIndicator,
    required this.itemCounts,
  });

  final int pageIndex;
  final int itemCounts;
  final Function(int? index)? onTapIndicator;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Padding(
      padding: const EdgeInsets.only(top: 25, right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          itemCounts,
          (index) => Flexible(
            flex: 1,
            child: CustomContainer(
              height: 5,
              duration: const Duration(milliseconds: 640),
              width: context.widthPx * 0.3,
              color: pageIndex == index ? theme.primary : Colors.blueGrey[100],
              borderRadius: BorderRadius.circular(10),
              margin: EdgeInsets.only(right: context.sp(5)),
            ).clickable(() {
              onTapIndicator != null ? onTapIndicator!(index) : null;
            }),
          ),
        ),
      ),
    );
  }
}
