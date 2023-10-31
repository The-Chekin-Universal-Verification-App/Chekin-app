// ignore_for_file: use_build_context_synchronously

import 'package:chekinapp/core/models/business_model.dart';
import 'package:chekinapp/core/providers/business_provider.dart';
import 'package:chekinapp/export.dart';
import 'package:chekinapp/routes/reviews/review_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../discover/discover_screen.dart';

class SocialMediaHandles extends StatelessWidget {
  const SocialMediaHandles({Key? key}) : super(key: key);

  void openWhatsapp(
      {required BuildContext context,
      required String text,
      String countryCode = "+234",
      required String number}) async {
    var whatsapp = countryCode + number; //+92xx enter like this
    var whatsappURlAndroid =
        "whatsapp://send?phone=$whatsapp/&text=${Uri.encodeFull(text)}";
    var whatsappURLIos = "https://wa.me/$whatsapp?text=${Uri.tryParse(text)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(
          whatsappURLIos,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    }
  }

  Future<void> _launchInWebViewWithoutJavaScript(String url,
      {bool enableJavaScript = false, required BuildContext context}) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration:
          WebViewConfiguration(enableJavaScript: enableJavaScript),
    )) {
      DialogServices.messageModalFromTop(context,
          message: "Could not open the vendor's address");
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    BusinessModel selectedBusiness = context
        .select((BusinessProvider provider) => provider.selectedBusiness);

    return Scaffold(
      body: Column(
        children: [
          const VSpace(10),
          Text(context.loc.vendorsContact,
              style: TextStyles.h5.copyWith(fontWeight: FontWeight.w700)),
          const VSpace(30),
          SocialMedialHandleItem(
              onItemTap: () {
                _launchInWebViewWithoutJavaScript(selectedBusiness.instagram,
                    context: context);
              },
              imagePath: R.png.instagram.svg,
              title: context.loc.instagram),
          SocialMedialHandleItem(
              onItemTap: () {
                _launchInWebViewWithoutJavaScript(selectedBusiness.twitter,
                    enableJavaScript: true, context: context);
              },
              imagePath: R.png.twitter.svg,
              title: context.loc.twitter),
          SocialMedialHandleItem(
              onItemTap: () {
                _launchInWebViewWithoutJavaScript(selectedBusiness.facebook,
                    context: context);
              },
              imagePath: R.png.facebook.svg,
              title: context.loc.facebook),
          SocialMedialHandleItem(
            onItemTap: () {
              _launchInWebViewWithoutJavaScript(selectedBusiness.tiktok,
                  enableJavaScript: true, context: context);
            },
            imagePath: R.png.tiktok.svg,
            title: context.loc.ticTok,
          ),
          SocialMedialHandleItem(
            onItemTap: () {
              // openWhatsapp(context: context, text: 'Hi', number: selectedProduct.business!.)
            },
            imagePath: R.png.whatsapp.svg,
            title: context.loc.whatsApp,
          ),
          SocialMedialHandleItem(
            onItemTap: () {
              _launchInWebViewWithoutJavaScript(selectedBusiness.linkedIn,
                  context: context);
            },
            imagePath: R.png.linkedIn.svg,
            title: context.loc.linkedIn,
          ),
        ],
      ),
    );
  }
}

class SocialMedialHandleItem extends StatelessWidget {
  const SocialMedialHandleItem(
      {super.key,
      required this.onItemTap,
      required this.imagePath,
      required this.title});

  final Function() onItemTap;
  final String imagePath;
  final String title;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    SvgPicture.asset(
                      imagePath,
                    ),
                    const HSpace(10),
                    Text(title,
                        style: TextStyles.h6
                            .copyWith(fontWeight: FontWeight.w500)),
                  ],
                ),
                Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: theme.greyWeakTwo,
                )
              ],
            ).clickable(onItemTap),
            const VSpace(8),
            const ChekInAppDivider(),
          ],
        ),
      ),
    );
  }
}
