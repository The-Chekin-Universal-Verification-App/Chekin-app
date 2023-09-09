import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../../core/commands/business_command.dart';
import '../../core/providers/business_provider.dart';
import '../../utils/imagepicker/image_picker_choice.dart';
import '../../utils/imagepicker/provider/image_provider.dart';
import '../payment/payment_screen.dart';
import 'components/upload_indicator.dart';

class UploadProfilePictureScreen extends StatefulWidget {
  const UploadProfilePictureScreen({Key? key}) : super(key: key);

  @override
  State<UploadProfilePictureScreen> createState() =>
      _UploadProfilePictureScreenState();
}

class _UploadProfilePictureScreenState
    extends State<UploadProfilePictureScreen> {
  List<String> uploadedImage = [];
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    //the image path selected
    String image = context.select((ImageProviders provider) => provider.image);
    BusinessProvider business = context.watch<BusinessProvider>();

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
                image != '' ? const VSpace(50) : const VSpace(90),
                Align(
                    alignment: Alignment.center,
                    child: image != ''
                        ? CircleAvatar(
                            radius: 100,
                            child: CircleAvatar(
                              radius: 99,
                              backgroundColor: Colors.white,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    height: 185,
                                    width: 185,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(185 / 2),
                                      child: ColorFiltered(
                                        colorFilter: const ColorFilter.mode(
                                            Colors.black26, BlendMode.darken),
                                        child: Image.file(
                                          File(image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: CustomContainer(
                                      height: 35.0,
                                      width: 35.0,
                                      borderRadius: Corners.s5Border,
                                      color: Colors.grey.withOpacity(0.7),
                                      child: Icon(
                                        Icons.close_rounded,
                                        color: theme.redButton,
                                      ),
                                    ).clickable(() {
                                      context
                                          .read<ImageProviders>()
                                          .clearSingleImagePath();
                                      context
                                          .read<BusinessProvider>()
                                          .resetUploadProgress();
                                    }),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Column(
                            children: [
                              uploadedImage.isNotEmpty
                                  ? ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(185 / 2),
                                      child: CustomContainer(
                                        color: theme.greenButton,
                                        height: 185,
                                        width: 186,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                                height: 80,
                                                width: 80,
                                                child: Icon(
                                                  Icons.check_circle,
                                                  size: 75.0,
                                                  color: Colors.white,
                                                )),

                                            ///
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  context.loc.completed,
                                                  style: TextStyles.body1
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      height: 178,
                                      // width: 1,
                                      child: SvgPicture.asset(
                                        R.png.addUserIcon.svg,
                                      )).clickable(() {
                                      CustomBottomSheet.openBottomSheet(
                                          context,
                                          sizeFraction: 0.2,
                                          const ImagePickerChoice());
                                    }),
                            ],
                          )),
                image != '' ? const VSpace(100) : const VSpace(153),
                const UploadIndicatorItem(),
              ],
            ),

            ///for the button
            Container(
              padding: const EdgeInsets.only(
                bottom: 20.0,
              ),
              child: PrimaryButton(
                onPressed: () async {
                  if (image != '' &&
                      business.uploadStatus != UploadStatus.completed) {
                    await BusinessCommand(context).updateBusinessDocument(
                      'businessImage',
                      image,
                    );

                    if (business.uploadStatus == UploadStatus.completed) {
                      setState(() {
                        uploadedImage.add(image);
                      });
                    }
                  } else {
                    context.push(const PaymentScreen());

                    // context.read<UploadProvider>().setCurrentUploadIndex = 4;
                    context.read<BusinessProvider>().resetUploadProgress();
                    context.read<ImageProviders>().clearSingleImagePath();
                  }
                },
                label: uploadedImage.isNotEmpty
                    ? 'Proceed to Payment'
                    : context.loc.upload,
                radius: 20,
                fullWidth: true,
                loading: business.isBusy,
                color: business.isBusy ? theme.primary : Colors.transparent,
                textColor: business.isBusy ? Colors.white : theme.black,
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
