import 'dart:io';

import 'package:bayt_finder/components/permission.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';
import 'package:permission_handler/permission_handler.dart';
class ImagePickerHelper {
  static Future<File> compressImage(File file) async {
    try {
      Uuid uuid = Uuid();
      String randomStrng = uuid.v4();

      Directory directory = await getTemporaryDirectory();

      String targetPath = "${directory.path}/$randomStrng.jpg";
      XFile? result = await FlutterImageCompress.compressAndGetFile(
          file.path, targetPath,
          quality: 30);
      return File(result!.path);
    } catch (e) {
      return file;
    }
  }

  Future<bool> galleryStatus() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      if(Platform.isIOS){
        var status = await Permission.photos.status;
        print(status);
        if (status == PermissionStatus.granted ||
            status == PermissionStatus.limited) {
          return true;
        } else {
          status = await Permission.photos.request();
          if (status == PermissionStatus.granted ||
              status == PermissionStatus.limited) {
            return true;
          } else {
            if( status == PermissionStatus.permanentlyDenied){
              openAppSettings();
            }else{
              return false;
            }
            return false;
          }
        }
      }else{
        final androidInfo = await deviceInfoPlugin.androidInfo;
        if (Platform.isAndroid && androidInfo!.version.sdkInt >= 33) {
          var status = await Permission.photos.status;
          print(status);
          if (status == PermissionStatus.granted ||
              status == PermissionStatus.limited) {
            return true;
          } else {
            status = await Permission.photos.request();
            if (status == PermissionStatus.granted ||
                status == PermissionStatus.limited) {
              return true;
            } else {
              return false;
            }
          }
        }
        else{
          var status = await Permission.storage.status;
          if (status == PermissionStatus.granted ||
              status == PermissionStatus.limited) {
            return true;
          } else {
            status = await Permission.storage.request();
            if (status == PermissionStatus.granted ||
                status == PermissionStatus.limited) {
              return true;
            } else {
              return false;
            }
          }
        }
      }

  }

  Future<bool> cameraStatus() async {
    var status = await Permission.camera.status;
    print(status);
    if (status == PermissionStatus.granted ||
        status == PermissionStatus.limited) {
      return true;
    } else {
      status = await Permission.camera.request();
      if (status == PermissionStatus.granted ||
          status == PermissionStatus.limited) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<File?> checkAndPickImage({required ImageSource imageSource}) async {
    if (imageSource == ImageSource.gallery) {
      var status = await galleryStatus();
      print(status);
      if (status == true) {
        return pickImage(imageSource: imageSource);
      } else {
        return null;
      }
    } else {
      var status = await cameraStatus();
      if (status == true) {
        return pickImage(imageSource: imageSource);
      } else {
        return null;
      }
    }
  }

  Future<List<File>?> checkAndPickImageMultipleImages() async {
    var status = await galleryStatus();
    print(status);
    if (status == true) {
      return pickMultipleImages();
    } else {
      return null;
    }
  }

  Future<List<File>?> pickMultipleImages() async {
    final List<File> filesImages = [];
    try {
      final images = await ImagePicker().pickMultiImage(
        limit: 10,
      );
      /*  FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.image,
        allowCompression: true,
      );*/
      if (images.isNotEmpty) {
        for (var image in images) {
          final compressedImage = await compressImage(File(image.path));
          filesImages.add(compressedImage);
        }
        return filesImages;
      } else {
        // User canceled the picker
        return [];
      }
      /*  if (result != null && result.files.isNotEmpty) {
        for (var image in result.files) {
          final compressedImage = await compressImage(File(image.path!));
          filesImages.add(compressedImage);
        }
        return filesImages;
      } else {
        // User canceled the picker
        return [];
      }*/
    } catch (e) {
      return [];
    }

    // log("HERE");

    // final selectedImages = await ImagePicker().pickMultiImage();
    // for (var imageAsset in selectedImages) {
    //   final ByteData byteData = await imageAsset.getByteData();
    //   final List<int> imageData = byteData.buffer.asUint8List();
    //   final File file =
    //       File("${(await getTemporaryDirectory()).path}/${imageAsset.name}");
    //   await file.writeAsBytes(imageData);
    //   filesImages.add(file);
    //   print(file);
    // }

    // final List<XFile> imagesXFiles = await ImagePicker().pickMultiImage(
    //   limit: 1000,
    //   imageQuality: 70,
    // );
    // for (var xfile in imagesXFiles) {
    //   filesImages.add(File(xfile.path));
    // }

    // return filesImages;
  }

/*  Future<List<File>?> pickMultipleImages() async {
    final List<File> filesImages = [];
    try {
      final images = await ImagePicker().pickMultipleMedia(
        limit: 10,
      );
      */ /*  FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.image,
        allowCompression: true,
      );*/ /*
      if (images.isNotEmpty && images != null) {
        for (var image in images) {
          print(image.mimeType);
          print(image.path);
          print(image.name);
          print(image.toString());
          final compressedImage = await compressImage(File(image.path));
          filesImages.add(compressedImage);
        }
        return filesImages;
      } else {
        // User canceled the picker
        return [];
      }
      */ /*  if (result != null && result.files.isNotEmpty) {
        for (var image in result.files) {
          final compressedImage = await compressImage(File(image.path!));
          filesImages.add(compressedImage);
        }
        return filesImages;
      } else {
        // User canceled the picker
        return [];
      }*/ /*
    } catch (e) {
      return [];
    }

    // log("HERE");

    // final selectedImages = await ImagePicker().pickMultiImage();
    // for (var imageAsset in selectedImages) {
    //   final ByteData byteData = await imageAsset.getByteData();
    //   final List<int> imageData = byteData.buffer.asUint8List();
    //   final File file =
    //       File("${(await getTemporaryDirectory()).path}/${imageAsset.name}");
    //   await file.writeAsBytes(imageData);
    //   filesImages.add(file);
    //   print(file);
    // }

    // final List<XFile> imagesXFiles = await ImagePicker().pickMultiImage(
    //   limit: 1000,
    //   imageQuality: 70,
    // );
    // for (var xfile in imagesXFiles) {
    //   filesImages.add(File(xfile.path));
    // }

    // return filesImages;
  }*/

  Future<File?> pickImage({required ImageSource imageSource}) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        final imageTemporary = File(image.path);
        final compressedImage = compressImage(imageTemporary);
        return compressedImage;
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
