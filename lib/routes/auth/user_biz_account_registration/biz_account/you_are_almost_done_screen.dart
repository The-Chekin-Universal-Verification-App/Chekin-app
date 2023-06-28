import 'package:chekinapp/routes/document_upload/upload_document_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

class YouAreAlmostDoneScreen extends StatelessWidget {
  const YouAreAlmostDoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return Scaffold(
      backgroundColor: theme.primary,
      appBar: CustomAppBar(
        backgroundColor: theme.primary,
        leadingIcon: LogoIconItem(
          iconUrl: R.png.appLogo.imgPng,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const VSpace(30),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.loc.youAreAlmostDone,
                      style: TextStyles.h5.txtColor(Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 369,
            ),
            Text(
              context.loc.youAreAlmostSet,
              style: TextStyles.h6.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),
            const VSpace(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 43.0),
              child: RichText(
                  textAlign: TextAlign.center,
                  text:
                      TextSpan(style: const TextStyle(height: 1.5), children: [
                    TextSpan(
                      text: context.loc.justFewDocumentUpload,
                      style: TextStyles.body1
                          .copyWith(color: Colors.white70, fontSize: 15),
                    ),
                  ])),
            ),
            const VSpace(106),
            Padding(
              padding: const EdgeInsets.only(right: 27.0, left: 27, bottom: 45),
              child: PrimaryButton(
                onPressed: () {
                  context.push(const UploadDocumentMainScreen());
                },
                label: context.loc.begin,
                radius: 20,
                fullWidth: true,
                color: theme.background,
                textColor: theme.primary,
                borderColor: theme.primary.withOpacity(0.48),
                contentPadding: const EdgeInsets.symmetric(vertical: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}