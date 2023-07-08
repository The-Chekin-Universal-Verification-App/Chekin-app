import 'package:chekinapp/routes/document_upload/upload_valid_ids.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../payment/payment_screen.dart';

class UploadProfilePictureScreen extends StatefulWidget {
  const UploadProfilePictureScreen({Key? key}) : super(key: key);

  @override
  State<UploadProfilePictureScreen> createState() =>
      _UploadProfilePictureScreenState();
}

class _UploadProfilePictureScreenState
    extends State<UploadProfilePictureScreen> {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    List<String> uploadedImage = [];
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ConstrainedBox(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height - 120),

        ///the 120 is the estimated appbar height and the page index indicator  taking them of allows the rest part of the screens to show up in the visible area
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VSpace(23),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.loc.documentUpload,
                      style: TextStyles.h5,
                    ),
                  ],
                ),
                const VSpace(5),
                Text(
                  context.loc.setProfilePicture,
                  style: TextStyles.h7.weight(FontWeight.bold),
                ),
                const VSpace(5),
                Text(
                  context.loc.uploadAProfilePicture,
                  style: TextStyles.body1,
                ),
                uploadedImage.isNotEmpty ? const VSpace(50) : const VSpace(90),
                Align(
                    alignment: Alignment.center,
                    child: uploadedImage.isNotEmpty
                        ? CircleAvatar(
                            radius: 130,
                          )
                        : SizedBox(
                            height: 178,
                            // width: 1,
                            child: SvgPicture.asset(
                              R.png.addUserIcon.svg,
                            ))),
                uploadedImage.isNotEmpty
                    ? const VSpace(100)
                    : const VSpace(153),
                UploadIndicator(
                  uploadValue: 0.4,
                  status: 'Completed',
                ),
              ],
            ),

            ///for the button
            Container(
              padding: const EdgeInsets.only(
                bottom: 20.0,
              ),
              child: PrimaryButton(
                onPressed: () {
                  context.push(const PaymentScreen());
                },
                label: context.loc.conti,
                radius: 20,
                fullWidth: true,
                color: Colors.transparent,
                textColor: theme.black,
                borderColor: theme.primary.withOpacity(0.48),
                contentPadding: const EdgeInsets.symmetric(vertical: 18),
              ),
            ),
            // VSpace(20),
          ], //
        ),
      ),
    );
  }
}
