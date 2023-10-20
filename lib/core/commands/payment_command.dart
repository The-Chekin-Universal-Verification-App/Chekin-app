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
      auth.setBusyPayment = true;
      res = await service
          .initPayment(auth.token, payload: {"paymentOption": paymentOption});
      auth.setBusyPayment = false;

      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          log(res.data.toString());
          context.push(PayStackFundPage(
            payStackUrl: res.data['data']["authorization_url"],
            subscriptionRef: res.data['data']["reference"] ?? "",
            subscriptionTitle: res.data['data']["paymentOption"] ?? "",
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

  Future<void> verifyPayment({required String ref}) async {
    BuildContext context = rootNav!.context;
    Response? res;

    PaymentService service = PaymentService();
    try {
      auth.setBusyPayment = true;
      res = await service.verifyPayment(auth.token, ref: ref);
      auth.setBusyPayment = false;

      if (res != null) {
        if (res.statusCode == 200 ||
            res.statusCode == 201 && res.data['status'] == "success") {
          log(res.data.toString());
          // Navigator.of(context).pop();
          Future.delayed(const Duration(seconds: 2), () {
            DialogServices.messageModalFromTop(context,
                message: 'Subscription Successfully paid for!');
          });
        } else {
          DialogServices.messageModalFromTop(context,
              message: 'We could not verify if Subscription was Successful ',
              notificationType: NotificationType.error);
        }
      }
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      null;
    }
  }
}

class PayStackFundPage extends StatefulWidget {
  const PayStackFundPage({
    Key? key,
    required this.payStackUrl,
    required this.subscriptionRef,
    required this.subscriptionTitle,
  }) : super(key: key);
  final String payStackUrl, subscriptionRef, subscriptionTitle;

  @override
  State<PayStackFundPage> createState() => _PayStackFundPageState();
}

class _PayStackFundPageState extends State<PayStackFundPage> {
  bool isVerifying = false;
  @override
  Widget build(BuildContext context) {
    log(widget.payStackUrl);
    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(
            onTapLeadingIcon: () {
              isVerifying = true;
              setState(() {});

              ///call verify endpoint
              PaymentCommand(context)
                  .verifyPayment(ref: widget.subscriptionRef);
              Future.delayed(const Duration(seconds: 3), () {
                isVerifying = false; // set loader to false
                setState(() {});
                Navigator.of(context).pop(); //pop of to the previous screen
              });
            },
            centerTitle: false,
            title: widget.subscriptionTitle,
          ),
          body: WebView(
            initialUrl: widget.payStackUrl,
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
        if (isVerifying) ...[
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: UnconstrainedBox(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 0.8,
                ),
              ),
            ),
          )
        ]
      ],
    );
  }
}
