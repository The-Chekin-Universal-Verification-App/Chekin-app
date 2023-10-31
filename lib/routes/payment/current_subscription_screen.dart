import 'package:chekinapp/core/providers/business_provider.dart';
import 'package:chekinapp/export.dart';
import 'package:chekinapp/routes/payment/payment_screen.dart';
import 'package:chekinapp/routes/settings/settings.dart';
import 'package:flutter/material.dart';

class CurrentSubscriptionScreen extends StatelessWidget {
  const CurrentSubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    var type = context.select((BusinessProvider auth) => auth.subscriptionType);
    Map<String, dynamic> subscriptionInfo =
        context.select((BusinessProvider biz) => biz.currentSubscriptionInfo);
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Insets.l),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const VSpace(23),
          Row(
            children: [
              SvgIcon(R.png.arrowLeftIcon.svg).clickable(() {
                context.pop();
              }),
              const HSpace(10),
              Text(
                context.loc.subscription,
                style: TextStyles.h5,
              ),
            ],
          ),
          const VSpace(5),
          Text(
            context.loc.youHaveVarietyOffer,
            style: TextStyles.h7.copyWith(fontSize: 15, color: theme.greyWeak),
          ),
          const VSpace(20),
          Text(
            context.loc.yourActiveSub,
            style: TextStyles.h6.copyWith(fontWeight: FontWeight.w700),
          ),
          const VSpace(20),
          IndexedStack(
            index: type == SubscriptionType.semiAnnually
                ? 0
                : type == SubscriptionType.quarterly
                    ? 1
                    : type == SubscriptionType.yearly
                        ? 2
                        : type == SubscriptionType.none
                            ? 3
                            : 3,
            children: [
              Stack(
                children: [
                  SemiAnnualItem(
                    amount: subscriptionInfo['amount'].toString(),
                    expires: subscriptionInfo['expires'],
                    isActive:
                        subscriptionInfo['status'].toString().toLowerCase() ==
                                'successful'
                            ? true
                            : false,
                  ).clickable(() {
                    // subscription = SubscriptionType.semiAnnual;
                    // setState(() {});
                  }),
                  Positioned(
                    left: 4,
                    bottom: 6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: ColoredBox(
                        color: Colors.white70,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 1),
                          child: Text(
                            context.loc.active,
                            style: TextStyles.body1.copyWith(
                                color: theme.greenButton,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Stack(
                children: [
                  QuarterlyItem(
                    amount: subscriptionInfo['amount'].toString(),
                    expires: subscriptionInfo['expires'],
                    isActive:
                        subscriptionInfo['status'].toString().toLowerCase() ==
                                'successful'
                            ? true
                            : false,
                  ).clickable(() {
                    // subscription = SubscriptionType.semiAnnual;
                    // setState(() {});
                  }),
                  Positioned(
                    left: 4,
                    bottom: 6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: ColoredBox(
                        color: Colors.white70,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 1),
                          child: Text(
                            context.loc.active,
                            style: TextStyles.body1.copyWith(
                                color: theme.greenButton,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Stack(
                children: [
                  AnnualItem(
                    amount: subscriptionInfo['amount'].toString(),
                    expires: subscriptionInfo['expires'],
                    isActive:
                        subscriptionInfo['status'].toString().toLowerCase() ==
                                'successful'
                            ? true
                            : false,
                  ).clickable(() {
                    // subscription = SubscriptionType.semiAnnual;
                    // setState(() {});
                  }),
                  Positioned(
                    left: 4,
                    bottom: 6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: ColoredBox(
                        color: Colors.white70,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 1),
                          child: Text(
                            context.loc.active,
                            style: TextStyles.body1.copyWith(
                                color: theme.greenButton,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                child: Text(
                  'You currently do not have any Subsccription plan',
                  style: TextStyles.body1,
                ),
              )
            ],
          ),
          VSpace(context.sp(30)),
          SettingsItem(
              onItemTap: () {
                context.push(const PaymentScreen());
              },
              title: context.loc.renewSub,
              imagePath: R.png.autoRenewal.svg)
        ]),
      ),
    ));
  }
}
