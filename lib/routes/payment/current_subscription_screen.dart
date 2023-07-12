import 'package:chekinapp/export.dart';
import 'package:chekinapp/routes/payment/payment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentSubscriptionScreen extends StatelessWidget {
  const CurrentSubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
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
        style: TextStyles.h7.copyWith(fontWeight: FontWeight.w700),
      ),
      const VSpace(20),
      Text(
        context.loc.managePassword,
        style: TextStyles.body1,
      ),
      const VSpace(15.0),
      SemiAnnualItem(
              // isActive: subscription == SubscriptionType.semiAnnual
              //     ? true
              //     : false,
              )
          .clickable(() {
        // subscription = SubscriptionType.semiAnnual;
        // setState(() {});
      }),
    ]));
  }
}
