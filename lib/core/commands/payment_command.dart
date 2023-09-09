// ignore_for_file: use_build_context_synchronously

import 'package:chekinapp/core/services/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../export.dart';

class PaymentCommand extends BaseCommand {
  PaymentCommand(super.c);

  AuthProvider get auth => getProvider();
  Future<void> initPayment({required String paymentOption}) async {
    BuildContext context = rootNav!.context;
    Response? res;

    PaymentService service = PaymentService();
    try {
      res = await service
          .initPayment(auth.token, payload: {"paymentOption": paymentOption});
      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          log(res.data.toString());
          context.push(PayStackFundPage(
            payStackUrl: res.data['data']["authorization_url"],
          ));
          // Future.delayed(const Duration(seconds: 2), () {
          //   DialogServices.messageModalFromTop(context,
          //       message: res?.data['message']);
          // });
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }
}

class PayStackFundPage extends StatelessWidget {
  const PayStackFundPage({
    Key? key,
    required this.payStackUrl,
  }) : super(key: key);
  final String payStackUrl;
  @override
  Widget build(BuildContext context) {
    log(payStackUrl);
    return Scaffold(
      appBar: const CustomAppBar(),
      body: WebView(
        initialUrl: payStackUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
