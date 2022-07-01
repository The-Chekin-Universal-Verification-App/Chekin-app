import 'package:chekin/screen/auth/controller/auth_controller.dart';
import 'package:chekin/shared/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chekin/shared/action_button.dart';
import 'package:chekin/shared/custom_text.dart';
import 'package:chekin/utils/colors.dart';
import 'package:chekin/utils/sizes.dart';
import 'package:chekin/constants/value.dart';

class PaymentInfo extends StatelessWidget {
  const PaymentInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AuthController authController = Get.find();
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
                        child: Obx(
                          () => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  authController.selectMontlyPayment();
                                },
                                child: Container(
                                  height: heightSize(45),
                                  width: constraints.maxWidth,
                                  decoration: BoxDecoration(
                                    color:
                                        authController.isMontlyPayment.value ==
                                                true
                                            ? kPrimaryColor.withOpacity(0.5)
                                            : kTransparent,
                                    borderRadius: BorderRadius.circular(
                                        Values().buttonRadius),
                                    border: Border.all(color: kGreyColor),
                                  ),
                                  child: const Center(
                                    child: CText(
                                      text: 'Monthly',
                                      color: kGreyColor,
                                      fontFamily: 'Lufga-Medium',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: heightSize(12)),
                              GestureDetector(
                                onTap: () {
                                  authController.selectYearlyPayment();
                                },
                                child: Container(
                                  height: heightSize(45),
                                  width: constraints.maxWidth,
                                  decoration: BoxDecoration(
                                    color:
                                        authController.isYearlyPayment.value ==
                                                true
                                            ? kPrimaryColor.withOpacity(0.5)
                                            : kTransparent,
                                    borderRadius: BorderRadius.circular(
                                        Values().buttonRadius),
                                    border: Border.all(color: kGreyColor),
                                  ),
                                  child: const Center(
                                    child: CText(
                                      text: 'Yearly',
                                      color: kGreyColor,
                                      fontFamily: 'Lufga-Medium',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: heightSize(12)),
                              GestureDetector(
                                onTap: () {
                                  authController.selectLifetimePayment();
                                },
                                child: Container(
                                  height: heightSize(45),
                                  width: constraints.maxWidth,
                                  decoration: BoxDecoration(
                                    color: authController
                                                .isLifetimePayment.value ==
                                            true
                                        ? kPrimaryColor.withOpacity(0.5)
                                        : kTransparent,
                                    borderRadius: BorderRadius.circular(
                                        Values().buttonRadius),
                                    border: Border.all(color: kGreyColor),
                                  ),
                                  child: const Center(
                                    child: CText(
                                      text: 'Lifetime',
                                      color: kGreyColor,
                                      fontFamily: 'Lufga-Medium',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),

                              //SizedBox(height: heightSize(41)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Obx(
                        () => ActionButton(
                          text: 'Pay',
                          callback: () {
                            if (authController.paymentOption.value.isEmpty) {
                              cToast(
                                  title: "Notice",
                                  message: "Please select a payment option");
                            } else {
                              authController.initializePayment(context);
                            }
                          },
                          load: authController.load.value,
                        ),
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
