// ignore_for_file: use_build_context_synchronously

import 'package:chekinapp/core/services/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../export.dart';
import '../../routes/payment/payment_screen.dart';
import '../providers/business_provider.dart';

class PaymentCommand extends BaseCommand {
  PaymentCommand(super.c);

  AuthProvider get auth => getProvider();
  BusinessProvider get business => getProvider();
  Future<Map<String, dynamic>> initPayment(
      {required String paymentOption}) async {
    BuildContext context = rootNav!.context;
    Map<String, dynamic> result = {};
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
          result = res.data['data'];
          // context.push(PayStackFundPage(
          //   payStackUrl: res.data['data']["authorization_url"],
          //   subscriptionRef: res.data['data']["reference"] ?? "",
          //   subscriptionTitle: res.data['data']["paymentOption"] ?? "",
          //   subscriptionType: paymentOption,
          // ));
          // Future.delayed(const Duration(seconds: 2), () {
          //   DialogServices.messageModalFromTop(context,
          //       message: res?.data['message']);
          // });
        }
      } else {}
    } catch (e) {
      /// if services is returning [null] then we would do nothing cause the exception thrown has been handled at the service class logic
      result = {};
    }
    return result;
  }

  // Future<void> pay({required String paymentOption}) async {
  //   // FlutterPaystackPlus.openPaystackPopup(
  //   //   publicKey: '-Your-public-key-',
  //   //   // customerEmail: 'youremail@gmail.com',
  //   //   // context: context,
  //   //   // secretKey: '-Your-secret-key-',
  //   //   amount: (500 * 100).toString(),
  //   //   // reference: DateTime.now().millisecondsSinceEpoch.toString(),
  //   //   onClosed: () {
  //   //     debugPrint('Could\'nt finish payment');
  //   //   },
  //   //   onSuccess: () async {
  //   //     debugPrint('successful payment');
  //   //   },
  //   //   email: 'meetjahwill@gmail.com',
  //   //   ref: DateTime.now().millisecondsSinceEpoch.toString(),
  //   // );
  // }

  Future<void> verifyPayment(
      {required String ref, required String subscriptionType}) async {
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
          business.seSubscriptionType = subscriptionType;
        } else {
          DialogServices.messageModalFromTop(context,
              message: 'We could not verify if Subscription was Successful ',
              notificationType: NotificationType.error);
          business.seSubscriptionType = 'none';
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
    required this.subscriptionType,
  }) : super(key: key);
  final String payStackUrl,
      subscriptionRef,
      subscriptionTitle,
      subscriptionType;

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
              Future.delayed(const Duration(seconds: 1), () {
                isVerifying = false; // set loader to false
                setState(() {});
                Navigator.of(context).pop(); //pop of to the previous screen
              });

              ///call verify endpoint
              PaymentCommand(context).verifyPayment(
                  ref: widget.subscriptionRef,
                  subscriptionType: widget.subscriptionType);
            },
            centerTitle: false,
            titleWidget: Text(
              '${widget.subscriptionTitle.toTitleCase()} Subscription',
              style: TextStyles.h5.copyWith(color: Colors.black),
            ),
            // title: '${widget.subscriptionTitle.toTitleCase()} Subscription',
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
