import 'package:bayt_finder/components/appbar/custom_appbar.dart';
import 'package:bayt_finder/extensions/loader_widget.dart';
import 'package:bayt_finder/nav.dart';
import 'package:bayt_finder/screens/news/cubit/news_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/HtmlWidget.dart';
import '../no_data_screen.dart';
import '../../extensions/text_styles.dart';

import '../../utils/app_common.dart';
import 'news_details_screen.dart';

class NewsAllScreen extends StatelessWidget {
   NewsAllScreen({super.key});

  final currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    NewsCubit newsCubit=NewsCubit.get(context);
    newsCubit.getAllNew();
    return BlocConsumer<NewsCubit, NewsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      appBar: CustomAppBar(title:"News Articles".tr(),showBack: true),
      body: Stack(
        children: [

          if(newsCubit.articleResponse.data !=null)ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16.h),
              itemCount: newsCubit.articleResponse.data!.length,
              itemBuilder: (context, index) {
                return InkWell(
                 onTap: () {
                   navigateTo( NewsDetailsScreen(articles: newsCubit.articleResponse.data![index]));
                   },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16.h,right: 16.w,left: 16.w),

                    child: Column(
                      spacing: 10.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                         borderRadius: BorderRadius.vertical(top:Radius.circular( 16.r)),
                          child: cachedImage(
                            newsCubit.articleResponse.data![index].articleImage!,
                            height: 110,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        Text(newsCubit.articleResponse.data![index].name!, style: boldTextStyle(size: 16), maxLines: 2, overflow: TextOverflow.ellipsis),
                        if(newsCubit.articleResponse.data![index].description !=null)CustomHtmlWidget(postContent:newsCubit.articleResponse.data![index].description),
                        Row(
                          children: [
                            Text(parseDocumentDate(DateTime.parse(newsCubit.articleResponse.data![index].createdAt!)), style: secondaryTextStyle(size: 12)),
                            SizedBox(width: 10.w,),
                            Icon(Icons.circle, size: 4,),
                            SizedBox(width: 4.w,),
                            
                            DateDifferenceWidget(startDate: DateTime.parse(newsCubit.articleResponse.data![index].createdAt!), endDate: currentDate),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
          if(state is GetNewsAllLoadingState)Center(child: Loader()),
          if(state is! GetNewsAllLoadingState &&newsCubit.articleResponse.data !=null &&newsCubit.articleResponse.data!.isEmpty)Center(child: NoDataScreen()),
        ],
      ),
    );
  },
);
  }
}
