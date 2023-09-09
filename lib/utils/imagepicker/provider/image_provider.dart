import 'package:chekinapp/export.dart';

class ImageProviders extends BaseProvider {
  List<String> _imagesPath = [];
  String _imagePath = '';
  List<String> get images => _imagesPath;

  bool _isUploading = false;
  bool get isUploading => _isUploading;
  set setIsUploading(bool val) {
    _isUploading = val;
    notifyListeners();
  }

  bool _imagePathIsAvailable = false;
  bool get isImagePathAvailable => _imagePathIsAvailable;

  bool _imageListPathIsAvailable = false;
  bool get isImageListPathAvailable => _imageListPathIsAvailable;

  set addImagesToListPath(String path) {
    _imagesPath.add(path);
    _imageListPathIsAvailable = true;
    notifyListeners();
  }

  String get image => _imagePath;
  set setImage(String path) {
    _imagePath = path;
    _imagePathIsAvailable = true; //you can ignore this line if not needed
    notifyListeners();
  }

  clearSingleImagePath() {
    _imagePath = '';
    _imagePathIsAvailable = false; //you can ignore this line if not needed also
    notifyListeners();
  }

  clearImagesPath({int? removeImageAtIndex}) {
    if (removeImageAtIndex != null &&
        _imagesPath.isNotEmpty &&
        _imagesPath.length > removeImageAtIndex) {
      _imagesPath.removeAt(removeImageAtIndex);
    } else {
      _imagesPath = [];
      _imageListPathIsAvailable =
          false; //ignore this line if not needed as well
    }
    notifyListeners();
  }
}
