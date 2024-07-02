// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/model/trending_news_model.dart';
import 'package:newsapp/widgets/article_view.dart';
import 'package:page_transition/page_transition.dart';

class CategoryNewsTile extends StatefulWidget {
  const CategoryNewsTile({
    Key? key,
    required this.news,
  }) : super(key: key);
  final News news;

  @override
  State<CategoryNewsTile> createState() => _CategoryNewsTileState();
}

class _CategoryNewsTileState extends State<CategoryNewsTile> {
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
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.h),
          child: Material(
            borderRadius: BorderRadius.circular(10.r),
            elevation: 3,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              padding: EdgeInsets.only(bottom: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: CachedNetworkImage(
                      cacheManager: cacheManager,
                      key: UniqueKey(),
                      imageUrl: widget.news.urlToImage.toString(),
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 5,
                      placeholder: (context, url) => Container(
                        color: Colors.black12,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
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
                    height: 6.h,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      widget.news.description.toString(),
                      maxLines: 3,
                      style: TextStyle(
                          fontSize: 14.sp,
                          height: 0.h,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
