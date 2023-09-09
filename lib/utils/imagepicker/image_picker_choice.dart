// ignore_for_file: use_build_context_synchronously

import 'package:chekinapp/utils/imagepicker/command/upload_files_cmd.dart';
import 'package:chekinapp/utils/imagepicker/preview_image.dart';
import 'package:chekinapp/utils/imagepicker/provider/image_provider.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

class ImagePickerChoice extends StatelessWidget {
  const ImagePickerChoice(
      {Key? key,
      this.addImageToList = true,
      this.showSuccessNotification = true,
      this.useOnlyCamera = false,
      this.onReturnImagePath})
      : super(key: key);
  final bool addImageToList;
  final bool showSuccessNotification;
  final bool useOnlyCamera;
  final Function(String imagePath)? onReturnImagePath;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Consumer<ImageProviders>(
      builder: (BuildContext context, imageProviders, child) => Container(
        height: 120,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: theme.background,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: !useOnlyCamera,
              child: InkWell(
                onTap: () async {
                  //call selectAndCropImage to pick image from gallery
                  File imageFile = await UploadFileCommand(context)
                      .cropImage(useCamera: false);
                  imageProviders.setImage = imageFile.path;
                  await context.push(PreviewImage(
                    imagePath: imageFile.path,
                    isNetworkImage: false,
                  ));
                  Navigator.of(context).pop();
                }, //
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 23,
                      backgroundColor: Colors.purpleAccent,
                      child: Icon(
                        Icons.image,
                        color: Colors.white,
                        size: 22.0,
                      ),
                    ),
                    const VSpace(10),
                    Text(
                      'Gallery',
                      style: TextStyles.h7,
                    )
                  ],
                ),
              ),
            ),
            const HSpace(50),
            InkWell(
              onTap: () async {
                //call selectAndCropImage to select image from camera
                File imageFile =
                    await UploadFileCommand(context).cropImage(useCamera: true);
                imageProviders.setImage = imageFile.path;
                await context.push(PreviewImage(
                  imagePath: imageFile.path,
                  isNetworkImage: false,
                ));
                Navigator.of(context).pop();
              },
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 23,
                    child: Icon(
                      Icons.camera,
                      size: 22.0,
                    ),
                  ),
                  const VSpace(10),
                  Text(
                    'Camera',
                    style: TextStyles.h7,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
