import 'package:chekinapp/export.dart';
import 'package:chekinapp/routes/main/main.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/business_model.dart';
import '../../../document_upload/upload_document_main_screen.dart';

class IncompleteAccountKYCNotifier extends StatelessWidget {
  const IncompleteAccountKYCNotifier({Key? key, required this.bizStatus})
      : super(key: key);
  final BusinessDocUploadModel bizStatus;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    //meetjahwil.l@gmail.com
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
                      context.loc.completeVerification,
                      style: TextStyles.h5.txtColor(Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const VSpace(20),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 180,
                child: SvgPicture.asset(
                  R.png.platformProtection.svg,
                  color: Colors.white,
                  height: 120,
                ),
              ),
            ),
            const VSpace(10),
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
                      text: context.loc.completeVerificationNote,
                      style: TextStyles.body1
                          .copyWith(color: Colors.white70, fontSize: 15),
                    ),
                  ])),
            ),
            const VSpace(50),
            _ActionItem(
              onTap: () {
                context.push(const UploadDocumentMainScreen());
              },
              title: 'Valid ID',
              isUploaded: bizStatus.idUpload,
            ),
            const VSpace(16),
            _ActionItem(
              onTap: () {
                context.push(const UploadDocumentMainScreen());
              },
              title: 'Utility',
              isUploaded: bizStatus.utility,
            ),
            const VSpace(16),
            _ActionItem(
              onTap: () {
                context.push(const UploadDocumentMainScreen());
              },
              title: 'Instagram account screenshot',
              isUploaded: bizStatus.instagramWhenLoggedIn,
            ),
            const VSpace(16),
            _ActionItem(
              onTap: () {
                context.push(const UploadDocumentMainScreen());
              },
              title: 'Facebook account screenshot',
              isUploaded: bizStatus.facebookWhenLoggedIn,
            ),
            const VSpace(16),
            _ActionItem(
              onTap: () {
                context.push(const UploadDocumentMainScreen());
              },
              title: 'Selfie with valid ID card',
              isUploaded: bizStatus.selfieHoldingId,
            ),
            const VSpace(40),
            Padding(
              padding: const EdgeInsets.only(right: 27.0, left: 27, bottom: 10),
              child: PrimaryButton(
                onPressed: () {
                  context.push(const UploadDocumentMainScreen());
                },
                label: context.loc.uploadDocuments,
                radius: 20,
                fullWidth: true,
                color: Colors.transparent,
                textColor: theme.background,
                borderColor: theme.background,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 27.0, left: 27, bottom: 30),
              child: PrimaryButton(
                onPressed: () {
                  context.push(const MainScreen());
                  // context.push(const UploadDocumentMainScreen());
                },
                label: context.loc.skipForNow,
                radius: 20,
                fullWidth: true,
                color: Colors.transparent,
                textColor: theme.background,
                // borderColor: theme.background,
                contentPadding: const EdgeInsets.symmetric(vertical: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionItem extends StatelessWidget {
  const _ActionItem(
      {super.key,
      required this.onTap,
      required this.title,
      required this.isUploaded});

  final Function() onTap;
  final bool isUploaded;
  final String title;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: onTap,
        child: CustomContainer(
          color: !isUploaded ? Colors.grey.shade400 : theme.background,
          borderRadius: Corners.s10Border,
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyles.body1,
              ),
              ColoredBox(
                color: Colors.transparent,
                child: !isUploaded
                    ? Icon(
                        Icons.warning_amber,
                        color: theme.secondary,
                        size: 25,
                      )
                    : Icon(
                        Icons.check_circle,
                        color: theme.greenButton,
                        size: 25,
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
