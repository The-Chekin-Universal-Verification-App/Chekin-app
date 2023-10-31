import 'package:chekinapp/core/commands/initialization_cmd.dart';
import 'package:chekinapp/routes/document_upload/upload_valid_ids.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

import '../../core/commands/payment_command.dart';
import '../../core/providers/business_provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  SubscriptionType? subscription;
  bool paymentCompleted = false;
  final plugin = PaystackPlugin();
  static const publicKey = 'pk_test_63bd747caee4909ad30dbd8ceb1cc74679899b33';

  @override
  initState() {
    plugin.initialize(publicKey: publicKey);
    subscription =
        Provider.of<BusinessProvider>(context, listen: false).subscriptionType;
    setState(() {});
    super.initState();
  }

  chargeCard(BuildContext context, int amount,
      {required String userEmail, required String ref}) async {
    var charge = Charge()
      ..amount = 100 * amount
      ..reference = ref
      ..putCustomField('custom_id', 'CheckinApp')
      // ..putMetaData("action", "link_debit_card")
      ..email = userEmail;

    CheckoutResponse response = await plugin.checkout(context,
        method: CheckoutMethod.card, charge: charge);

    if (response.status == true) {
      setState(() {
        paymentCompleted = true;
      });

      if (mounted) {
        DialogServices.messageModalFromTop(context,
            message:
                "Your ${MoneySymbols.ngn}$amount Funding was Successful Check Your Wallet For Balance ");

        InitializationCmd(context)
            .refreshUser(); //refresh the app to get new user details
      }
    } else {
      // setState(() {
      //   paymentCompleted = true;
      // });
      null;
    }
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    bool paymentLoading =
        context.select((AuthProvider auth) => auth.paymentLoading);
    UserModel user = context.select((AuthProvider auth) => auth.user);
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
      body: Stack(
        children: [
          AbsorbPointer(
            absorbing: paymentLoading,
            child: SingleChildScrollView(
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
                              color: theme.primary,
                              fontWeight: FontWeight.w700),
                        ),
                        const VSpace(20),
                        QuarterlyItem(
                          isActive: subscription == SubscriptionType.quarterly
                              ? true
                              : false,
                        ).clickable(() async {
                          subscription = SubscriptionType.quarterly;
                          setState(() {});
                          Map<String, dynamic> res =
                              await PaymentCommand(context)
                                  .initPayment(paymentOption: "quarterly");

                          if (mounted && res != {}) {
                            chargeCard(context, res['amount'],
                                userEmail: user.email, ref: res['reference']);
                          }
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
                          isActive:
                              subscription == SubscriptionType.semiAnnually
                                  ? true
                                  : false,
                        ).clickable(() async {
                          subscription = SubscriptionType.semiAnnually;

                          setState(() {});

                          // PaymentCommand(context)
                          //     .initPayment(paymentOption: "semi-annually");

                          Map<String, dynamic> res =
                              await PaymentCommand(context)
                                  .initPayment(paymentOption: "semi-annually");

                          if (mounted && res != {}) {
                            chargeCard(context, res['amount'],
                                userEmail: user.email, ref: res['reference']);
                          }
                        }),

                        const VSpace(10),
                        AnnualItem(
                                isActive:
                                    subscription == SubscriptionType.yearly
                                        ? true
                                        : false)
                            .clickable(() async {
                          subscription = SubscriptionType.yearly;
                          setState(() {});
                          // PaymentCommand(context)
                          //     .initPayment(paymentOption: "yearly");
//
                          Map<String, dynamic> res =
                              await PaymentCommand(context)
                                  .initPayment(paymentOption: "yearly");

                          if (mounted && res != {}) {
                            chargeCard(context, res['amount'],
                                userEmail: user.email, ref: res['reference']);
                          }
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
                          Navigator.of(context)
                              .pop(); // context.push(const AddNewCardScreen());
                        },
                        label: context.loc.conti,
                        radius: 20,
                        fullWidth: true,
                        color: paymentCompleted
                            ? theme.primary
                            : Colors.transparent,
                        textColor:
                            paymentCompleted ? Colors.white : theme.black,
                        borderColor: theme.primary.withOpacity(0.48),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 18),
                      ),
                    ),
                    // VSpace(20),
                  ], //
                ),
              ),
            ),
          ),
          if (paymentLoading) ...[
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: UnconstrainedBox(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                  ),
                ),
              ),
            )
          ]
        ],
      ),
    );
  }
}

class QuarterlyItem extends StatelessWidget {
  const QuarterlyItem({
    super.key,
    this.isActive = false,
    this.amount,
    this.expires,
  });

  final bool isActive;
  final String? amount, expires;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.3),
          isActive ? BlendMode.lighten : BlendMode.darken),
      child: DashedRect(
        color: isActive ? Colors.transparent : Theme.of(context).primaryColor,
        fChild: Container(
          color: isActive ? Theme.of(context).primaryColor : Colors.transparent,
          padding:
              EdgeInsets.symmetric(vertical: context.sp(20), horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  amount == null
                      ? "${context.loc.quarterly}  ₦28,545 (3 MONTHS)"
                      : "${context.loc.quarterly} ₦$amount",
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
      ),
    );
  }
}

class SemiAnnualItem extends StatelessWidget {
  const SemiAnnualItem({
    super.key,
    this.isActive = false,
    this.amount,
    this.expires,
  });

  final bool isActive;
  final String? amount, expires;
  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.3),
          isActive ? BlendMode.lighten : BlendMode.darken),
      child: DashedRect(
        color: isActive ? Colors.transparent : Theme.of(context).primaryColor,
        fChild: Container(
          color: isActive ? Theme.of(context).primaryColor : Colors.transparent,
          padding:
              EdgeInsets.symmetric(vertical: context.sp(20), horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  amount == null
                      ? "${context.loc.semiAnnual} ₦50,562 (6 MONTHS)"
                      : "${context.loc.semiAnnual} ₦$amount",
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
      ),
    );
  }
}

class AnnualItem extends StatelessWidget {
  const AnnualItem({
    super.key,
    this.isActive = false,
    this.amount,
    this.expires,
  });

  final bool isActive;
  final String? amount, expires;
  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.3),
          isActive ? BlendMode.lighten : BlendMode.darken),
      child: DashedRect(
        color: isActive ? Colors.transparent : Theme.of(context).primaryColor,
        fChild: Container(
          color: isActive ? Theme.of(context).primaryColor : Colors.transparent,
          padding:
              EdgeInsets.symmetric(vertical: context.sp(20), horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  amount == null
                      ? "${context.loc.yearly} ₦97,530"
                      : "${context.loc.yearly} ₦$amount",
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
      ),
    );
  }
}

// class PayStackPayment {
//   final plugin = PaystackPlugin();
//   static const publicKey = 'pk_test_63bd747caee4909ad30dbd8ceb1cc74679899b33';
//
//   init() {
//     plugin.initialize(publicKey: publicKey);
//   }
//
//   // String _getRefrence() {
//   //   var platForm = (Platform.isIOS) ? 'iOS' : 'Android';
//   //   final thisDate = DateTime.now().microsecondsSinceEpoch;
//   //   return 'ChargeFrom${platForm}_$thisDate';
//   // }
//
//   chargeCard(BuildContext context, int amount,
//       {required String userEmail, required String ref}) async {
//     var charge = Charge()
//       ..amount = 100 * amount
//       ..reference = ref
//       ..putCustomField('custom_id', 'CheckinApp')
//       // ..putMetaData("action", "link_debit_card")
//       ..email = userEmail;
//
//     CheckoutResponse response = await plugin.checkout(context,
//         method: CheckoutMethod.card, charge: charge);
//
//     if (response.status == true) {
//       // if (mounted) {
//       // context.pushOff(const MainScreen());
//       DialogServices.messageModalFromTop(context,
//           message:
//               "Your ${MoneySymbols.ngn}$amount Funding was Successful Check Your Wallet For Balance ");
//       // TransactionsCommand(context).getWallet();
//       // }
//     } else {
//       // getSnabar(msg: 'Payment Failed');
//     }
//   }
// }
