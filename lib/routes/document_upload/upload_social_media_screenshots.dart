import 'package:chekinapp/routes/document_upload/upload_document_main_screen.dart';
import 'package:chekinapp/routes/document_upload/upload_valid_ids.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../../core/commands/business_command.dart';
import '../../core/providers/business_provider.dart';
import '../../utils/imagepicker/image_picker_choice.dart';
import '../../utils/imagepicker/provider/image_provider.dart';
import 'components/bottomsheet_selector.dart';
import 'components/upload_indicator.dart';

class UploadSocialMediaScreenShotScreen extends StatefulWidget {
  const UploadSocialMediaScreenShotScreen({Key? key}) : super(key: key);

  @override
  State<UploadSocialMediaScreenShotScreen> createState() =>
      _UploadSocialMediaScreenShotScreenState();
}

class _UploadSocialMediaScreenShotScreenState
    extends State<UploadSocialMediaScreenShotScreen> {
  List imagesToUpload = [];
  List uploadedImages = [];
  String firstImageType = '';
  String secondImageType = '';

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    BusinessProvider business = context.watch<BusinessProvider>();
    int pageIndex = context
        .select((UploadProvider provider) => provider.currentUploadIndex);
    //the image path selected
    String image = context.select((ImageProviders provider) => provider.image);
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
                    Text(
                      context.loc.skip,
                      style: TextStyles.h5,
                    ).clickable(() {
                      context.read<UploadProvider>().setCurrentUploadIndex =
                          pageIndex + 1;
                    }),
                  ],
                ),
                const VSpace(5),
                Text(
                  context.loc.socialMediaScreenShot,
                  style: TextStyles.h7.weight(FontWeight.bold),
                ),
                const VSpace(5),
                Text(
                  context.loc.takeScreenShot,
                  style: TextStyles.body1,
                ),
                const VSpace(34),
                Row(
                  children: [
                    Flexible(
                      child: CustomBottomSheetSelector(
                        heightFraction: 0.3,
                        onSelectItem: (item) {
                          firstImageType = item;
                          setState(() {});
                        },
                        items: const [
                          'Facebook',
                          'Instagram',
                          'Twitter',
                          'Tiktok',
                          'Other',
                        ],
                      ),
                    ),
                    const HSpace(10),
                    Flexible(
                      child: CustomBottomSheetSelector(
                        heightFraction: 0.3,
                        onSelectItem: (item) {
                          secondImageType = item;
                          setState(() {});
                        },
                        items: const [
                          'Facebook',
                          'Instagram',
                          'Twitter',
                          'Tiktok',
                          'Other',
                        ],
                      ),
                    ),
                  ],
                ),
                const VSpace(34),
                FittedBox(
                  child: Wrap(
                    children: [
                      FileUploadItem(
                        onItemSelected: (val) {
                          setState(() {
                            imagesToUpload.add(image);
                          });
                          context.read<ImageProviders>().clearSingleImagePath();
                        },
                        onTapRemoveImage: (image) {
                          imagesToUpload.removeAt(0);
                          setState(() {});
                        },
                        onTapUploadImage: (image) async {
                          ///this is used to upload any of the first social media image
                          if (image != '' &&
                              business.uploadStatus != UploadStatus.completed &&
                              firstImageType != '') {
                            // call the upload method
                            await BusinessCommand(context)
                                .updateBusinessDocument(
                              'instagramWhenLoggedIn',
                              image,
                            );
                          } else {
                            DialogServices.messageModalFromTop(context,
                                message:
                                    'Please select the first type of social media image to upload first',
                                notificationType: NotificationType.error);
                          }

                          ///add to list uf uploaded images if successful
                          if (business.uploadStatus == UploadStatus.completed &&
                              business.isBusy == false) {
                            uploadedImages.add(image);
                            setState(() {});

                            if (mounted) {
                              ///always remember to clear up the progress status of the first upload
                              context
                                  .read<BusinessProvider>()
                                  .resetUploadProgress();
                            }
                          }
                        },
                        comparingItem:
                            uploadedImages.isNotEmpty ? uploadedImages[0] : '',
                        isUploaded: false,
                        isUploading: business.isBusy,
                        pickedImagePath:
                            imagesToUpload.isNotEmpty ? imagesToUpload[0] : '',
                      ),
                      if (imagesToUpload.isNotEmpty) ...[
                        const HSpace(5),
                        FileUploadItem(
                          onItemSelected: (val) {
                            setState(() {
                              imagesToUpload.add(image);
                            });
                            context
                                .read<ImageProviders>()
                                .clearSingleImagePath();
                          },
                          onTapRemoveImage: (image) {
                            imagesToUpload.removeAt(1);
                            setState(() {});
                          },

                          ///this is where the uploading happens
                          onTapUploadImage: (image) async {
                            if (image != '' &&
                                business.uploadStatus !=
                                    UploadStatus.completed &&
                                secondImageType != '') {
                              await BusinessCommand(context)
                                  .updateBusinessDocument(
                                'facebookWhenLoggedIn',
                                image,
                              );
                            } else {
                              DialogServices.messageModalFromTop(context,
                                  message:
                                      'Please select the second type of social media image to upload first',
                                  notificationType: NotificationType.error);
                            }

                            ///add to list uf uploaded images if successful
                            if (business.uploadStatus ==
                                    UploadStatus.completed &&
                                business.isBusy == false) {
                              uploadedImages.add(image);
                              setState(() {});
                            }
                          },
                          comparingItem: uploadedImages.length > 1
                              ? uploadedImages[1]
                              : '',
                          label: context.loc.addNew,
                          isRequired: false,
                          isUploading: business.isBusy,
                          // isUploading: firstItemUploadBusy,
                          pickedImagePath: imagesToUpload.length > 1
                              ? imagesToUpload[1]
                              : '',
                        ),
                      ]
                    ],
                  ),
                ),
                const VSpace(30),
                const UploadIndicatorItem(),
              ],
            ),

            ///for the button
            Container(
              padding: const EdgeInsets.only(
                bottom: 20.0,
              ),
              child: PrimaryButton(
                onPressed: () {
                  if (uploadedImages.length == 2) {
                    context.read<UploadProvider>().setCurrentUploadIndex =
                        pageIndex + 1;
                    // context.read<UploadProvider>().setCurrentUploadIndex = 3;
                    context.read<BusinessProvider>().resetUploadProgress();
                    imagesToUpload = [];
                    uploadedImages = [];
                  } else {
                    DialogServices.messageModalFromTop(context,
                        message: 'Please you must upload two images',
                        notificationType: NotificationType.error);
                  }
                },
                label: context.loc.conti,
                radius: 20,
                fullWidth: true,
                color: uploadedImages.length == 2
                    ? theme.primary
                    : Colors.transparent,
                loading: business.isBusy,
                textColor:
                    uploadedImages.length == 2 ? Colors.white : theme.black,
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

class FileUploadItem extends StatefulWidget {
  const FileUploadItem(
      {super.key,
      this.onItemSelected,
      required this.comparingItem,
      this.isUploaded,
      this.label,
      this.isRequired = true,
      required this.pickedImagePath,
      this.onTapUploadImage,
      this.onTapRemoveImage,
      this.isUploading = false});

  @override
  State<FileUploadItem> createState() => _FileUploadItemState();
  final Function(String val)? onItemSelected;
  final Function(String val)? onTapUploadImage;
  final Function(String val)? onTapRemoveImage;
  final String comparingItem;
  final String? label;
  final bool? isUploaded;
  final bool isUploading;
  final bool isRequired;
  final String pickedImagePath;
}

class _FileUploadItemState extends State<FileUploadItem> {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return DashedRect(
        color: (widget.pickedImagePath != '' &&
                    widget.comparingItem == widget.pickedImagePath) ||
                widget.isUploaded == true
            ? Colors.transparent
            : theme.primary,
        fChild: (widget.pickedImagePath != '' &&
                    widget.comparingItem == widget.pickedImagePath) ||
                widget.isUploaded == true
            ? CustomContainer(
                color: theme.greenButton,
                height: 179,
                width: 165,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.pickedImagePath != '') ...[
                      const SizedBox(
                          height: 80,
                          width: 80,
                          child: Icon(
                            Icons.check_circle,
                            size: 75.0,
                            color: Colors.white,
                          )),
                    ],

                    ///
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.loc.completed,
                          style: TextStyles.body1.copyWith(
                              fontWeight: FontWeight.w900, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : SizedBox(
                height: 179,
                width: 165,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ///
                      widget.pickedImagePath != ''
                          ? Stack(
                              children: [
                                Image.file(
                                  File(widget.pickedImagePath),
                                ),
                                Positioned(
                                  right: 2,
                                  top: 2,
                                  child: GestureDetector(
                                    onTap: widget.onTapRemoveImage != null
                                        ? () {
                                            widget.onTapRemoveImage!(
                                                widget.pickedImagePath);
                                          }
                                        : () {},
                                    child: Material(
                                      color: Colors.white70,
                                      borderRadius: Corners.s5Border,
                                      child: SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: Icon(
                                          Icons.close_rounded,
                                          color: theme.redButton,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ) //this icons shows when a file is picked from gallery or camera
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: 99,
                                    width: 99,
                                    child: SvgPicture.asset(
                                      R.png.cloudUploading.svg,
                                    )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.label ?? context.loc.frontPlease,
                                      style: TextStyles.body1.copyWith(
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      '*',
                                      style: TextStyles.h5.copyWith(
                                          height: 1.5,
                                          color: widget.isRequired
                                              ? theme.redButton
                                              : Colors.transparent,
                                          fontWeight: FontWeight.w900),
                                    )
                                  ],
                                ),
                              ],
                            ).clickable(() async {
                              await CustomBottomSheet.openBottomSheet(
                                  context,
                                  sizeFraction: 0.2,
                                  const ImagePickerChoice());

                              widget.onItemSelected!('');
                            }), //this show no file is picked yet and when we tap a file is picked from storage
                      ///
                      if (widget.pickedImagePath != '') ...[
                        Positioned(
                          child: widget.isUploading
                              ? const CircularProgressIndicator(
                                  strokeWidth: 2,
                                )
                              : Material(
                                  color: Colors.white70,
                                  borderRadius: Corners.s5Border,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 25,
                                        width: 25,
                                        child: SvgPicture.asset(
                                          R.png.cloudUploading.svg,
                                        ),
                                      ),
                                      Text(
                                        context.loc.tapToUpload,
                                        style: TextStyles.caption.copyWith(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ).rippleClick(widget.onTapUploadImage != null
                                      ? () {
                                          widget.onTapUploadImage!(
                                              widget.pickedImagePath);
                                        }
                                      : () {}),
                                ),
                        ),
                      ],
                    ],
                  ),
                ),
              ));
  }
}
