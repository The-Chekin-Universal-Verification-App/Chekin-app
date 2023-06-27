// import 'package:flutter/material.dart';
// import 'package:setsubmobile/export.dart';
//
// class UploadFileCommand extends BaseCommand {
//   UploadFileCommand(super.c);
//   AuthProvider get auth => getProvider<AuthProvider>();
//
//   ///get image from device or camera
//   Future<File> getImage({required bool useCamera}) async {
//     BuildContext ctx = rootNav!.context;
//     ImagePicker imgPicker = ImagePicker();
//
//     File image;
//     if (useCamera) {
//       final pickedFile = await imgPicker.pickImage(source: ImageSource.camera);
//       if (pickedFile != null) {
//         image = File(pickedFile.path);
//
//         return image;
//       } else {
//         ctx.showInAppNotification('no image selected');
//
//         return File('');
//       }
//     } else {
//       final pickedFile = await imgPicker.pickImage(
//           source: ImageSource.gallery, imageQuality: 80);
//
//       if (pickedFile != null) {
//         image = File(pickedFile.path);
//
//         //return image path
//         return image;
//       } else {
//         ctx.showInAppNotification('no image selected');
//
//         //return empty image path
//         return File('');
//       }
//     }
//   }
//
//   Future<File?> cropImage(
//       {required File sourceImage,
//       required GlobalKey<CropState> cropKey}) async {
//     final scale = cropKey.currentState?.scale;
//     final area = cropKey.currentState?.area;
//     final File croppedFile;
//
//     if (area == null) {
//       return null;
//       //means can not crop image.
//     } else {
//       final sample = await ImageCrop.sampleImage(
//           file: sourceImage, preferredSize: (2000 / scale!).round());
//       croppedFile = await ImageCrop.cropImage(file: sample, area: area);
//
//       sample.delete();
//     }
//
//     return croppedFile;
//   }
//
//   Future<String?> selectAndCropImage({required bool useCamera}) async {
//     BuildContext context = rootNav!.context;
//     File imageFile =
//         await getImage(useCamera: useCamera); //get image from device
//
//     File? croppedFile = await context.push(CropImageScreen(
//       sourceImage: imageFile,
//     ));
//
//     log('uploadImageCmd class line 64  un cropped Image:: ${imageFile.path}');
//     return croppedFile?.path;
//   }
//
//   Future<String?> uploadSingleImage(File imageFile) async {
//     BuildContext context = rootNav!.context;
//
//     Uint8List byteData = await imageFile.readAsBytes(); //convert to byte
//
//     UploadImageService service = UploadImageService();
//     Response? res = await service.uploadImage(byteData, token: auth.token);
//     log('uploadImageCmd class line 64:: ${res.toString()}');
//     return imageFile.path;
//   }
//
//   /// Future<List<String>?> uploadMultipleImage(List<File> imageFiles) async {
//   ///   BuildContext context = rootNav!.context;
//   ///
//   ///   UploadImageService service = UploadImageService();
//   /// Response? res = await service.uploadImage(byteData, token: auth.token);
//   /// log('uploadImageCmd class line 64:: ${res.toString()}');
//   /// return [];
//   /// }
// }
