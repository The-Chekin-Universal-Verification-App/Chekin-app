// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class UploadFileCommand extends BaseCommand {
  UploadFileCommand(super.c);
  AuthProvider get auth => getProvider<AuthProvider>();
  // ImageProviders get imageProvider => getProvider<ImageProviders>();

  ///get image from device or camera;
  Future<File> getImage({required bool useCamera}) async {
    BuildContext ctx = rootNav!.context;
    ImagePicker imgPicker = ImagePicker();

    File image;
    if (useCamera) {
      final pickedFile = await imgPicker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        image = File(pickedFile.path);

        return image;
      } else {
        DialogServices.messageModalFromTop(ctx,
            message: 'no image selected',
            notificationType: NotificationType.error);

        return File('');
      }
    } else {
      final pickedFile = await imgPicker.pickImage(
          source: ImageSource.gallery, imageQuality: 80);

      if (pickedFile != null) {
        image = File(pickedFile.path);

        //return image path
        return image;
      } else {
        DialogServices.messageModalFromTop(ctx,
            message: 'no image selected',
            notificationType: NotificationType.error);

        return File('');
      }
    }
  }

//this function is used to crop the image file
  ///return cropped image as File()
  Future<File> cropImage({bool useCamera = true}) async {
    File imageFile =
        await getImage(useCamera: useCamera); //get image from device

    CroppedFile? cropped = await ImageCropper()
        .cropImage(sourcePath: imageFile.path, aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ], uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Crop',
          cropGridColor: Colors.black,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      IOSUiSettings(title: 'Crop')
    ]);

    if (cropped != null) {
      return imageFile = File(cropped.path);
    } else {
      return File('');
    }
  }
}
