import 'package:bayt_finder/components/appbar/custom_appbar.dart';
import 'package:bayt_finder/nav.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../extensions/animatedList/animated_wrap.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../extensions/decorations.dart';
import '../../models/property_details_model.dart';
import '../../utils/app_common.dart';
import '../../utils/colors.dart';
import 'Image_view_screen.dart';
import '../YoutubePlayerScreen.dart';

class PhotoGalleyScreen extends StatefulWidget {
  final PropertyDetail? mPropertyDetail;

  const PhotoGalleyScreen({super.key, required this.mPropertyDetail});

  @override
  State<PhotoGalleyScreen> createState() => _PhotoGalleyScreenState();
}

class _PhotoGalleyScreenState extends State<PhotoGalleyScreen> {
  String thumbnail = '';

  @override
  void initState() {
    super.initState();
  }

  String getYoutubeThumbnail(String url) {
    String? videoId = YoutubePlayer.convertUrlToId(url);
    thumbnail = "https://img.youtube.com/vi/$videoId/maxresdefault.jpg";
    return thumbnail;
  }

  bool validateYouTubeUrl(String? url) {
    if (url != null) {
      RegExp regExp = RegExp(
          r"(https?://)?(www\.)?(youtube\.com/watch\?v=|youtu\.be/)([a-zA-Z0-9_-]+)");
      return regExp.hasMatch(url);
    }
    return false;
  }

  void handleOnTap(String? url, String? img) {
    if (url!.contains("youtube.com") &&
        validateYouTubeUrl(widget.mPropertyDetail!.videoUrl)) {
      navigateTo(YoutubeVideoScreen(url: url));
    } else {
      //VideoPlayerScreen(thumbnail: img, url: url).launch(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "gallery".tr(), showBack: true),
      //  bottomNavigationBar: showBannerAdOnPhotoGallerySelected && appStore.isSubscribe == 0 ? showBannerAds(context) : SizedBox(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.mPropertyDetail!.videoUrl != null)
              Stack(
                alignment: Alignment.center,
                children: [
                  widget.mPropertyDetail!.videoUrl != null &&
                          widget.mPropertyDetail!.videoUrl
                              .contains("youtube.com")
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: cachedImage(
                              getYoutubeThumbnail(
                                  widget.mPropertyDetail!.videoUrl),
                              fit: BoxFit.fill,
                              height: 250.h,
                              width: double.infinity))
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: cachedImage(widget.mPropertyDetail!.videoUrl,
                              fit: BoxFit.fill,
                              height: 250.h,
                              width: double.infinity)),
                  Center(
                    child: InkWell(
                      onTap: () {
                        handleOnTap(
                            widget.mPropertyDetail!.videoUrl, thumbnail);
                      },
                      child: widget.mPropertyDetail!.videoUrl
                              .contains("youtube.com")
                          ? Icon(AntDesign.youtube, color: Colors.red, size: 36)
                          : Container(
                              height: 45,
                              width: 45,
                              decoration: boxDecorationWithRoundedCorners(
                                  boxShape: BoxShape.circle,
                                  backgroundColor: AppColors.colorMaster),
                              child: Icon(Icons.play_arrow,
                                  color: Colors.white, size: 28),
                            ),
                    ),
                  ),
                ],
              ),
            if (widget.mPropertyDetail!.videoUrl != null) Divider(),
            AnimatedWrap(
              columnCount: 2,
              runSpacing: 8,
              spacing: 8,
              itemCount: widget.mPropertyDetail!.propertyGallaryArray!.length,
              children: List.generate(
                widget.mPropertyDetail!.propertyGallaryArray!.length,
                (i) {
                  return InkWell(
                      onTap: () {
                        navigateTo(ImageViewScreen(
                            propertyGallery:
                                widget.mPropertyDetail!.propertyGallaryArray));
                      },
                      child:ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: cachedImage(
                            widget.mPropertyDetail!.propertyGallaryArray![i].url,
                            fit: BoxFit.cover,
                            height: 200.h,
                            width: (double.infinity - 40) / 2),
                      ));
                },
              ),
            ),
            SizedBox(
              height: 16.w,
            ),
          ],
        ),
      ),
    );
  }
}
