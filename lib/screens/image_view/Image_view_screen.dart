import 'package:bayt_finder/components/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';
import '../../models/property_details_model.dart';
import '../../utils/app_common.dart';
import '../../utils/colors.dart';

class ImageViewScreen extends StatefulWidget {
  final List<PropertyGallaryArray>? propertyGallery;

  const ImageViewScreen({super.key, this.propertyGallery});

  @override
  _ImageViewScreenState createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(title: ''),
      body: PhotoViewGallery.builder(
        itemCount: widget.propertyGallery!.length,
        scrollPhysics: BouncingScrollPhysics(),
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: Image.network(
              width: double.infinity,
              color: AppColors.colorMaster,
              widget.propertyGallery![index].url.toString(),
              loadingBuilder: (context, child, loadingProgress) {
                return commonCacheImageWidget('');
              },
            ).image,
          );
        },
        loadingBuilder: (context, event) => Center(
          child: SizedBox(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              value: 2,
              valueColor: AlwaysStoppedAnimation(AppColors.colorMaster),
            ),
          ),
        ),
      ),
    );
  }
}
