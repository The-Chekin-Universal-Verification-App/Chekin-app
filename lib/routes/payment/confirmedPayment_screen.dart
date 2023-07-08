import 'package:chekinapp/export.dart';
import 'package:chekinapp/routes/auth/login_screen.dart';
import 'package:chekinapp/routes/payment/payment_processing_screen.dart';
import 'package:flutter/material.dart';

class ConfirmedPaymentScreen extends StatelessWidget {
  const ConfirmedPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
      backgroundColor: theme.greenButton,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 190,
              child: Column(
                children: [
                  const Icon(
                    Icons.check_circle,
                    size: 155.0,
                    color: Colors.white,
                  ),
                  const VSpace(10),
                  Text(
                    context.loc.paymentConfirmed,
                    style: TextStyles.h6.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            child: Container(
              height: 60,
              width: context.widthPx,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PrimaryButton(
                onPressed: () {
                  context.push(const PaymentProcessingScreen());
                },
                label: context.loc.conti,
                color: Colors.transparent,
                borderColor: Colors.white,
                radius: Corners.s8,
                fullWidth: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ErrorOccurredPaymentScreen extends StatelessWidget {
  const ErrorOccurredPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffAC0000),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 190,
              child: Column(
                children: [
                  Icon(
                    Icons.cancel_rounded,
                    size: 155.0,
                    color: Colors.white,
                  ),
                  const VSpace(10),
                  Text(
                    context.loc.errorOccurred,
                    style: TextStyles.h6.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ).clickable(() {
              context.push(const LogInScreen());
            }),
          ),
          Positioned(
            bottom: 40,
            child: Center(
              child: Text(
                context.loc.redirecting,
                style: TextStyles.h6
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }
}
