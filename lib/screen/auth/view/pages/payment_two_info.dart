import 'package:chekin/constants/assets_path.dart';
import 'package:chekin/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chekin/shared/action_button.dart';
import 'package:chekin/shared/custom_text.dart';
import 'package:chekin/utils/colors.dart';
import 'package:chekin/utils/sizes.dart';

class PaymentInfoTwo extends StatelessWidget {
  const PaymentInfoTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: LayoutBuilder(
              builder: ((context, constraints) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(18, 18, 18, 8),
                      color: kPrimaryColor,
                      height: heightSize(149),
                      width: constraints.maxWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () {
                                //Get.back();
                              },
                              child: const Icon(Icons.arrow_back_ios)),
                          SizedBox(height: heightSize(31)),
                          const CText(
                            text: 'Payment Info',
                            color: kBlackColor,
                            size: 25,
                            fontFamily: 'Lufga-SemiBold',
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: heightSize(6)),
                          const CText(
                            text: 'Pay Non-refundable Fee',
                            color: kBlackColor,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
                            Image.asset(laughing),
                            const Spacer(),

                            //SizedBox(height: heightSize(41)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: ActionButton(
                        text: 'Proceed to Verification',
                        callback: () {
                          Get.toNamed(Routes.ID_CONFIRM);
                        },
                      ),
                    ),
                    SizedBox(height: heightSize(12)),
                    const CText(
                      text:
                          'By clicking Continue, you agree with our \nTerms and Conditions',
                      textAlign: TextAlign.center,
                      size: 15,
                      height: 1.1,
                    ),
                    SizedBox(height: heightSize(14)),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
