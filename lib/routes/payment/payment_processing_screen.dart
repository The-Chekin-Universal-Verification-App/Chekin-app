import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';

import 'confirmedPayment_screen.dart';

class PaymentProcessingScreen extends StatelessWidget {
  const PaymentProcessingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white70,
              child: Transform.rotate(
                angle: 28.0,
                child: Icon(
                  Icons.rectangle_sharp,
                  color: Theme.of(context).primaryColor,
                  size: 70,
                ),
              ),
            ).clickable(() {
              context.push(ErrorOccurredPaymentScreen());
            }),
            const VSpace(10),
            Text(context.loc.processing,
                style: TextStyles.h6
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w600))
          ],
        ),
      ),
    );
  }
}
