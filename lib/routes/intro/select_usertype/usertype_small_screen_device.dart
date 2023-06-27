import 'package:flutter/material.dart';
import 'package:lookapp/export.dart';
import 'package:lookapp/routes/intro/oboarding/get_started_screen.dart';
import 'package:lookapp/routes/intro/select_usertype/set_a_user_type.dart';
import '../../../core/providers/app_provider.dart';
import '../../../core/providers/auth_provider.dart';

class SetUserTypeSmallScreen extends StatelessWidget {
  const SetUserTypeSmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    List onboards = R.M.getUserTypes(context);
    int pageIndex =
        context.select((AppProvider provider) => provider.onBoardPageIndex);
    return Scaffold(
        appBar: CustomAppBar(
          leading: true,
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
        body: SafeArea(
            child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.loc.whoAreYou,
                    style: TextStyles.h5,
                  ),
                  const VSpace(5),
                  Text(
                    context.loc.pickProfile,
                    style: TextStyles.body1,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: PageView(
              clipBehavior: Clip.none,
              pageSnapping: true,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (val) {
                context.read<AppProvider>().setOnBoardPageIndex = val;
              },
              children: [
                UserTypeBoardingPages(
                  onboards: onboards,
                  index: 0,
                ),
                UserTypeBoardingPages(
                  onboards: onboards,
                  index: 1,
                ),
              ],
            ),
          ),
          const VSpace(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboards.length,
              (index) => CustomContainer(
                height: 5,
                duration: const Duration(milliseconds: 640),
                width: pageIndex == index ? 45 : 20,
                color:
                    pageIndex == index ? theme.primary : Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(10),
                margin: const EdgeInsets.only(right: 5),
              ),
            ),
          ),
          const VSpace(28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: PrimaryButton(
              onPressed: () {
                if (pageIndex == 1) {
                  context.read<AuthProvider>().setAccountType = UserType.biz;
                } else {
                  context.read<AuthProvider>().setAccountType = UserType.normal;
                }
                context.push(const GetStartedScreen());
              },
              label: context.loc.conti,
              radius: 20,
              fullWidth: true,
              color: Colors.transparent,
              textColor: theme.black,
              borderColor: theme.primary.withOpacity(0.48),
              contentPadding: const EdgeInsets.symmetric(vertical: 18),
            ),
          ),
          const VSpace(15),
          const TermsAndConditionWidget(),
          const VSpace(55),
        ])));
  }
}
