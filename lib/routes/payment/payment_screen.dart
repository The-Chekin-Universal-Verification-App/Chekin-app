import 'package:chekinapp/routes/document_upload/upload_valid_ids.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import 'confirmedPayment_screen.dart';

enum SubscriptionType { quarterly, semiAnnual, annually }

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  SubscriptionType? subscription;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 120),

          ///the 120 is the estimated appbar height and the page index indicator  taking them of allows the rest part of the screens to show up in the visible area
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VSpace(23),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.loc.chooseSubscription,
                        style: TextStyles.h5,
                      ),
                    ],
                  ),
                  const VSpace(5),
                  Text(
                    context.loc.pickSubscription,
                    style: TextStyles.h7.weight(FontWeight.bold),
                  ),
                  const VSpace(10),
                  Text(
                    context.loc.thisAmountNotRefundable,
                    style: TextStyles.body1.copyWith(
                        color: theme.primary, fontWeight: FontWeight.w700),
                  ),
                  const VSpace(20),
                  QuarterlyItem(
                    isActive: subscription == SubscriptionType.quarterly
                        ? true
                        : false,
                  ).clickable(() {
                    subscription = SubscriptionType.quarterly;
                    setState(() {});
                  }),
                  // DashedRect(
                  //   color: subscription == SubscriptionType.quarterly
                  //       ? Colors.transparent
                  //       : theme.primary,
                  //   fChild: Container(
                  //     // height: 160,
                  //     padding: EdgeInsets.symmetric(
                  //         vertical: context.sp(20), horizontal: 10),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(context.loc.quarterly,
                  //             style: TextStyles.body1
                  //                 .copyWith(fontWeight: FontWeight.w700)),
                  //         const VSpace(20),
                  //         Row(
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           children: [
                  //             CircleAvatar(
                  //               radius: 3,
                  //               backgroundColor: theme.black,
                  //             ),
                  //             const HSpace(10),
                  //             Text(context.loc.oneReview,
                  //                 style: TextStyles.body2),
                  //           ],
                  //         ),
                  //         const VSpace(10),
                  //         Row(
                  //           children: [
                  //             CircleAvatar(
                  //               radius: 3,
                  //               backgroundColor: theme.black,
                  //             ),
                  //             const HSpace(10),
                  //             Expanded(
                  //               child: Text(
                  //                 context.loc.haveToRenewSub,
                  //                 overflow: TextOverflow.clip,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ).clickable(() {
                  //   subscription = SubscriptionType.quarterly;
                  //   setState(() {});
                  // }),
                  const VSpace(10),
                  SemiAnnualItem(
                    isActive: subscription == SubscriptionType.semiAnnual
                        ? true
                        : false,
                  ).clickable(() {
                    subscription = SubscriptionType.semiAnnual;
                    setState(() {});
                  }),

                  const VSpace(10),
                  AnnualItem(
                          isActive: subscription == SubscriptionType.annually
                              ? true
                              : false)
                      .clickable(() {
                    subscription = SubscriptionType.annually;
                    setState(() {});
                  }),
                  const VSpace(30),
                ],
              ),

              ///for the button
              Container(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                ),
                child: PrimaryButton(
                  onPressed: () {
                    context.push(const ConfirmedPaymentScreen());
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
              // VSpace(20),
            ], //
          ),
        ),
      ),
    );
  }
}

class QuarterlyItem extends StatelessWidget {
  const QuarterlyItem({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return DashedRect(
      color: isActive ? Colors.transparent : Theme.of(context).primaryColor,
      fChild: Container(
        color: isActive ? Theme.of(context).primaryColor : Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: context.sp(20), horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.loc.quarterly,
                style: TextStyles.body1.copyWith(
                    fontWeight: FontWeight.w700,
                    color: isActive ? Colors.white : null)),
            const VSpace(20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 3,
                  backgroundColor: isActive ? Colors.white : Colors.black,
                ),
                const HSpace(10),
                Text(context.loc.oneReview,
                    style: TextStyles.body2
                        .copyWith(color: isActive ? Colors.white : null)),
              ],
            ),
            const VSpace(10),
            Row(
              children: [
                CircleAvatar(
                  radius: 3,
                  backgroundColor: isActive ? Colors.white : Colors.black,
                ),
                const HSpace(10),
                Expanded(
                  child: Text(context.loc.haveToRenewSub,
                      overflow: TextOverflow.clip,
                      style: TextStyles.body2
                          .copyWith(color: isActive ? Colors.white : null)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SemiAnnualItem extends StatelessWidget {
  const SemiAnnualItem({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return DashedRect(
      color: isActive ? Colors.transparent : Theme.of(context).primaryColor,
      fChild: Container(
        color: isActive ? Theme.of(context).primaryColor : Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: context.sp(20), horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.loc.semiAnnual,
                style: TextStyles.body1.copyWith(
                    fontWeight: FontWeight.w700,
                    color: isActive ? Colors.white : null)),
            const VSpace(20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 3,
                  backgroundColor: isActive ? Colors.white : Colors.black,
                ),
                const HSpace(10),
                Text(context.loc.getEverything,
                    style: TextStyles.body2
                        .copyWith(color: isActive ? Colors.white : null)),
              ],
            ),
            const VSpace(10),
            Row(
              children: [
                CircleAvatar(
                  radius: 3,
                  backgroundColor: isActive ? Colors.white : Colors.black,
                ),
                const HSpace(10),
                Expanded(
                  child: Text(context.loc.getPercentageOff,
                      overflow: TextOverflow.clip,
                      style: TextStyles.body2
                          .copyWith(color: isActive ? Colors.white : null)),
                ),
              ],
            ),
            const VSpace(10),
            Row(
              children: [
                CircleAvatar(
                  radius: 3,
                  backgroundColor: isActive ? Colors.white : Colors.black,
                ),
                const HSpace(10),
                Expanded(
                  child: Text(context.loc.advertisingInterviewVideo,
                      overflow: TextOverflow.clip,
                      style: TextStyles.body2
                          .copyWith(color: isActive ? Colors.white : null)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AnnualItem extends StatelessWidget {
  const AnnualItem({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return DashedRect(
      color: isActive ? Colors.transparent : Theme.of(context).primaryColor,
      fChild: Container(
        color: isActive ? Theme.of(context).primaryColor : Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: context.sp(20), horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.loc.yearly,
                style: TextStyles.body1.copyWith(
                    fontWeight: FontWeight.w700,
                    color: isActive ? Colors.white : null)),
            const VSpace(20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 3,
                  backgroundColor: isActive ? Colors.white : Colors.black,
                ),
                const HSpace(10),
                Text(context.loc.getEverythingSemiAnnualPlan,
                    style: TextStyles.body2
                        .copyWith(color: isActive ? Colors.white : null)),
              ],
            ),
            const VSpace(10),
            Row(
              children: [
                CircleAvatar(
                  radius: 3,
                  backgroundColor: isActive ? Colors.white : Colors.black,
                ),
                const HSpace(10),
                Expanded(
                  child: Text(context.loc.getFourteenPercentOff,
                      overflow: TextOverflow.clip,
                      style: TextStyles.body2
                          .copyWith(color: isActive ? Colors.white : null)),
                ),
              ],
            ),
            const VSpace(10),
            Row(
              children: [
                CircleAvatar(
                  radius: 3,
                  backgroundColor: isActive ? Colors.white : Colors.black,
                ),
                const HSpace(10),
                Expanded(
                  child: Text(context.loc.advertisingInterviewVideo,
                      overflow: TextOverflow.clip,
                      style: TextStyles.body2
                          .copyWith(color: isActive ? Colors.white : null)),
                ),
              ],
            ),
            const VSpace(10),
            Row(
              children: [
                CircleAvatar(
                  radius: 3,
                  backgroundColor: isActive ? Colors.white : Colors.black,
                ),
                const HSpace(10),
                Expanded(
                  child: Text(
                    context.loc.getAdvertBanner,
                    overflow: TextOverflow.clip,
                    style: TextStyles.body2
                        .copyWith(color: isActive ? Colors.white : null),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
