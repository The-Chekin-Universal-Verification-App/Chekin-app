import 'package:chekinapp/routes/document_upload/upload_valid_ids.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

class UploadSocialMediaScreenShotScreen extends StatefulWidget {
  const UploadSocialMediaScreenShotScreen({Key? key}) : super(key: key);

  @override
  State<UploadSocialMediaScreenShotScreen> createState() =>
      _UploadSocialMediaScreenShotScreenState();
}

class _UploadSocialMediaScreenShotScreenState
    extends State<UploadSocialMediaScreenShotScreen> {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    List uploadedImg = [
      // 's',
    ];
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
                  context.loc.socialMediaScreenShot,
                  style: TextStyles.h7.weight(FontWeight.bold),
                ),
                const VSpace(5),
                Text(
                  context.loc.takeScreenShot,
                  style: TextStyles.body1,
                ),
                const VSpace(34),
                CustomBottomSheetSelector(
                  heightFraction: 0.3,
                  onSelectItem: (item) {
                    // print(item);
                  },
                  items: [
                    'Utility bill(Proof of address)',
                    'C.A.C Documents',
                  ],
                ),
                const VSpace(34),
                FittedBox(
                  child: Wrap(
                    children: [
                      FileUploadItem(
                        comparingItem: '',

                        // onTapItem: () {},
                      ),
                      if (uploadedImg.isNotEmpty) ...[
                        const HSpace(5),
                        FileUploadItem(
                          comparingItem: '',
                          label: context.loc.addNew,
                          isRequired: false,
                          // onTapItem: () {},
                        ),
                      ]
                    ],
                  ),
                ),
                const VSpace(30),
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
                onPressed: () {},
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

class FileUploadItem extends StatefulWidget {
  const FileUploadItem(
      {super.key,
      this.onItemSelected,
      required this.comparingItem,
      this.isUploaded,
      this.label,
      this.isRequired = true,
      this.onTapUploadImage});

  @override
  State<FileUploadItem> createState() => _FileUploadItemState();
  final Function(String val)? onItemSelected;
  final Function(String val)? onTapUploadImage;
  final String comparingItem;
  final String? label;
  final bool? isUploaded;
  final bool isRequired;
}

class _FileUploadItemState extends State<FileUploadItem> {
  late List<String> selectedItem = [];

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return DashedRect(
        color: theme.primary,
        fChild: (selectedItem.isNotEmpty &&
                    widget.comparingItem == selectedItem[0]) ||
                widget.isUploaded == true
            ? CustomContainer(
                color: theme.greenButton,
                height: 179,
                width: 165,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (selectedItem.isNotEmpty) ...[
                      const SizedBox(
                          height: 99,
                          width: 99,
                          child: Icon(
                            Icons.check_circle,
                            size: 30,
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
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (selectedItem.isNotEmpty) ...[
                      Positioned(
                        right: 5.0,
                        top: 5,
                        child: Column(
                          children: [
                            SizedBox(
                                height: 35,
                                width: 35,
                                child: SvgPicture.asset(
                                  R.png.cloudUploading.svg,
                                )),
                            Text(
                              context.loc.tapToUpload,
                              style: TextStyles.body3
                                  .copyWith(fontWeight: FontWeight.w900),
                            ),
                          ],
                        ).rippleClick(widget.onTapUploadImage != null
                            ? widget.onTapUploadImage!(selectedItem[0])
                            : () {}),
                      ),
                    ],

                    ///
                    selectedItem.isNotEmpty
                        ? Icon(
                            Icons.file_present_rounded,
                            size: 90,
                            color: theme.greyWeak.withOpacity(0.3),
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
                                    style: TextStyles.body1
                                        .copyWith(fontWeight: FontWeight.w900),
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
                          ).clickable(() {
                            selectedItem.add('Mikelite');
                            if (widget.onItemSelected != null) {
                              widget.onItemSelected!(selectedItem[0]);
                            } else {
                              null;
                            }
                            setState(() {});
                          }), //this show no file is picked yet and when we tap a file is picked from storage
                  ],
                ),
              ));
  }
}
