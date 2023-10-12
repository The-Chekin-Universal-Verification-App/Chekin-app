import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';
import '../auth/change_password.dart';
import '../auth/login_screen.dart';
import '../payment/current_subscription_screen.dart';
import '../whislist/whish_list.dart';
import 'settings.dart';
import '../reviews/review_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    UserModel user = context.select((AuthProvider provider) => provider.user);

    UserType userType =
        context.select((AuthProvider provider) => provider.accountType);
    return Scaffold(
      appBar: CustomAppBar(
        leading: false,
        titleWidget: Text(
          context.loc.settings,
          style: TextStyles.h3.copyWith(color: theme.txt),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Insets.l),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CircleAvatar(
                    radius: 25,
                    child: Image.network(
                      user.profileImageUrl,
                      errorBuilder: (BuildContext context, _, d) =>
                          const Icon(Icons.person),
                    ),
                  ),
                ),
                const HSpace(9),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${user.firstName} ${user.lastName}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.body1
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      const VSpace(2),
                      Text(
                        user.email,
                        style: TextStyles.body1.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: theme.greyWeakTwo),
                      ),
                      const VSpace(5),
                      Row(
                        children: [
                          Material(
                            color: theme.greenButton,
                            borderRadius: Corners.s10Border,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 3),
                              child: Text(
                                userType.name,
                                style: TextStyles.body1.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          const HSpace(3),
                          Material(
                            color: theme.greenButton,
                            borderRadius: Corners.s10Border,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 3),
                              child: Text(
                                context.loc.online,
                                style: TextStyles.body1.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const VSpace(10),
            const ChekInAppDivider(),
            const VSpace(10),
            SettingsItem(
              onItemTap: () {
                // navigate to account switcher class between user and biz account
                context.push(const UserTypeProfileAccountSwitcher());
              },
              title: context.loc.manageAccount,
              imagePath: R.png.personIcon.svg,
            ),
            SettingsItem(
              onItemTap: () {
                context.push(const ChangePasswordScreen());
              },
              imagePath: R.png.passwordProtection.svg,
              title: context.loc.password,
            ),
            if (userType == UserType.biz) ...[
              SettingsItem(
                onItemTap: () {
                  MySnackBar(context: context)
                      .showSnackBar(message: 'Coming soon!');
                },
                imagePath: R.png.privacyTips.svg,
                title: context.loc.privacy,
              ),
              SettingsItem(
                onItemTap: () {
                  context.push(const CurrentSubscriptionScreen());
                },
                imagePath: R.png.paymentIcon.svg,
                title: context.loc.subscription,
              ),
            ],
            const ChekInAppDivider(),
            const VSpace(10),
            SettingsItem(
              onItemTap: () {},
              imagePath: R.png.bell.svg,
              title: context.loc.pushNotification,
              trailIcon: Switch(
                value: true,
                onChanged: (val) {},
                activeColor: theme.primary,
              ),
            ),
            // SettingsItem(
            //   onItemTap: () {},
            //   imagePath: R.png.darkMode.svg,
            //   title: context.loc.darkMode,
            //   trailIcon: Switch(
            //     value: false,
            //     onChanged: (val) {},
            //     activeColor: theme.primary,
            //   ),
            // ),
            SettingsItem(
              onItemTap: () {
                DialogServices.showLanguageCountry(context);
              },
              imagePath: R.png.languageIcon.svg,
              title: context.loc.language,
            ),
            const ChekInAppDivider(),
            const VSpace(10),
            // SettingsItem(
            //   onItemTap: () {},
            //   imagePath: R.png.platformProtection.svg,
            //   title: context.loc.appPermissions,
            // ),
            SettingsItem(
              onItemTap: () {
                MySnackBar(context: context)
                    .showSnackBar(message: 'Coming soon!');
              },
              imagePath: R.png.personIcon.svg,
              title: context.loc.help,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                  onPressed: () {
                    CustomBottomSheet.openBottomSheet(
                      context,
                      sizeFraction: 0.3,
                      Column(
                        children: [
                          Text(
                            context.loc.logout,
                            style: TextStyles.h6.copyWith(
                                fontWeight: FontWeight.w700,
                                color: theme.redButton),
                          ),
                          const VSpace(20),
                          Divider(
                            color: theme.dividerColor,
                          ),
                          const VSpace(14),
                          Text(
                            "Are you sure you want to log out?",
                            style: TextStyles.body2.copyWith(
                                fontWeight: FontWeight.w600,
                                color: theme.black),
                          ),
                          const VSpace(24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  context.pop();
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 16),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: Corners.s10Border,
                                      side: BorderSide(color: theme.primary)),
                                ),
                                child: Text(
                                  'cancel',
                                  style: TextStyles.body3.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: theme.primary),
                                ),
                              ),
                              const HSpace(20),
                              TextButton(
                                onPressed: () {
                                  //
                                  context.read<MainProvider>().setNavIndex = 0;
                                  // context.pushOff(const LogInScreen());
                                  SharedPrefs.remove('token');
                                  SharedPrefs.remove('user');
                                  SharedPrefs.remove('refreshToken');
                                  SharedPrefs.remove('password');

                                  // LoginCmd(context).logOUt(popToLogin: false);
                                },
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: Corners.s10Border,
                                    ),
                                    backgroundColor: theme.primary),
                                child: Text(
                                  context.loc.logout,
                                  style: TextStyles.body3.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: theme.primary.withOpacity(0.04)),
                  child: Text(
                    context.loc.logout,
                    style: TextStyles.body2.copyWith(
                        color: theme.redButton, fontWeight: FontWeight.w600),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  const SettingsItem(
      {super.key,
      required this.onItemTap,
      required this.imagePath,
      this.trailIcon,
      this.title = 'title'});

  final Function() onItemTap;
  final String imagePath, title;
  final Widget? trailIcon;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: theme.primary.withOpacity(0.15),
                          borderRadius: Corners.s10Border),
                      child: Center(
                        child: SvgPicture.asset(
                          imagePath,
                        ),
                      ),
                    ),
                    const HSpace(10),
                    Text(title,
                        style: TextStyles.body1
                            .copyWith(fontWeight: FontWeight.w500)),
                  ],
                ),
                trailIcon ??
                    Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: theme.greyWeakTwo,
                    )
              ],
            ).clickable(onItemTap),
            const VSpace(8),
          ],
        ),
      ),
    );
  }
}
