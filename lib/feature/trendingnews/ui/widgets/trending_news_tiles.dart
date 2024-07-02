// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/model/trending_news_model.dart';
import 'package:newsapp/widgets/article_view.dart';
import 'package:page_transition/page_transition.dart';

class TrendingNewsTile extends StatefulWidget {
  const TrendingNewsTile({
    Key? key,
    required this.news,
  }) : super(key: key);
  final News news;

  @override
  State<TrendingNewsTile> createState() => _TrendingNewsTileState();
}

class _TrendingNewsTileState extends State<TrendingNewsTile> {
  final cacheManager = CacheManager(Config("imageCached",
      stalePeriod: const Duration(days: 15), maxNrOfCacheObjects: 100));
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(PageTransition(
            child: ArticleView(blogUrl: widget.news.url),
            type: PageTransitionType.fade));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5.h),
          child: Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(15.r),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: CachedNetworkImage(
                      cacheManager: cacheManager,
                      key: UniqueKey(),
                      height: 120.h,
                      width: 120.w,
                      fit: BoxFit.cover,
                      imageUrl: widget.news.urlToImage.toString(),
                      placeholder: (context, url) => Container(
                        color: Colors.black12,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.0.h,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          widget.news.title.toString(),
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 18.sp,
                            height: 0.h,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          widget.news.content.toString(),
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: 14.sp,
                              height: 0,
                              color: Colors.black45,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
