import 'package:bayt_finder/nav.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/dashBoard_response.dart';
import '../screens/home/slider_details_screen.dart';
import '../utils/colors.dart';

class SlidesComponents extends StatefulWidget {
  final List<MSlider>? data;
  const SlidesComponents({super.key, this.data});

  @override
  State<SlidesComponents> createState() => _SlidesComponentsState();
}

class _SlidesComponentsState extends State<SlidesComponents> {
  final pageController = PageController();
  final pageViewController = PageController();
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
    // pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
        widget.data!.length,
            (index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: SizedBox(
              height: 220.h,
              width: double.infinity,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 220.h,
                    child: PageView(
                      controller: pageViewController,
                      reverse: true,
                      pageSnapping: true,
                      onPageChanged: (index) {
                        currentIndex = index;
                        setState(() {});
                      },

                      children: widget.data!
                          .map(
                            (e) {
                          return InkWell(
                            onTap: (){
                              navigateTo(SliderDetailsScreen(slider: e));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: Image.network(
                                '${e.sliderImage}',
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                widget.data!
                                    .length, (index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0.w),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  width: currentIndex == index ? 20.w : 10.w,
                                  height: 15.w,
                                  decoration: BoxDecoration(
                                    color: currentIndex == index ? AppColors.colorWhite : AppColors.colorMasterActive,
                                    shape: BoxShape.circle,

                                    // shape: BoxShape.circle,
                                  ),
                                ),
                              );
                            })),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
            },
      ),
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        reverse: false,
        viewportFraction: 1,
        autoPlayAnimationDuration: const Duration(
            milliseconds: 1000),
        aspectRatio: 2.2,
        initialPage: 0,
        height: 220.h,
        enableInfiniteScroll: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayCurve: Curves.fastOutSlowIn,
        onPageChanged: (index, _) {
          setState(() {
            currentIndex = index;
          });
        },
        scrollDirection: Axis.horizontal,
      ),
    );

  }
}

class DotsIndicator extends StatelessWidget {
  final bool isSelected;
  const DotsIndicator({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: isSelected ? 30.w : 15.w,
        height: 15.w,
        decoration: BoxDecoration(
            color: isSelected ? AppColors.colorMaster : Colors.white,
            borderRadius: BorderRadius.circular(100.r)
          // shape: BoxShape.circle,
        ),
      ),
    );
  }
}
