import 'package:chekinapp/export.dart';
import 'package:chekinapp/routes/payment/payment_screen.dart';
import 'package:chekinapp/routes/settings/settings.dart';
import 'package:flutter/material.dart';

class CurrentSubscriptionScreen extends StatelessWidget {
  const CurrentSubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Insets.l),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const VSpace(23),
          Row(
            children: [
              SvgIcon(R.png.arrowLeftIcon.svg),
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
          Stack(
            children: [
              SemiAnnualItem(
                      // isActive: subscription == SubscriptionType.semiAnnual
                      //     ? true
                      //     : false,
                      )
                  .clickable(() {
                // subscription = SubscriptionType.semiAnnual;
                // setState(() {});
              }),
              Positioned(
                left: 4,
                bottom: 10,
                child: ColoredBox(
                  color: Colors.transparent,
                  child: Text(
                    context.loc.active,
                    style: TextStyles.body1.copyWith(
                        color: theme.greenButton, fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
          VSpace(context.sp(30)),
          SettingsItem(
              onItemTap: () {
                context.push(const PaymentScreen());
              },
              imagePath: R.png.autoRenewal.svg)
        ]),
      ),
    ));
  }
}
