import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/feature/shimmer/ui/widget/trending_news_loading_tiles.dart';
import 'package:newsapp/feature/shimmer/ui/widget/categoring_loading_tiles.dart';
import 'package:shimmer/shimmer.dart';

class HomePageLoading extends StatefulWidget {
  const HomePageLoading({super.key});

  @override
  State<HomePageLoading> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePageLoading> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
        baseColor: Colors.black26,
        highlightColor: Colors.white,
        period: const Duration(milliseconds: 700),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0.w),
                height: 70.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const CategoryLoadingTiles();
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Container(
                      height: 25.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(5.r)),
                    ),
                    const Spacer(),
                    Container(
                      height: 25.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(5.r)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50.w),
                height: 200.h,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(15.r)),
              ),
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: Container(
                  height: 25.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Row(
                    children: [
                      indicator(),
                      indicator(),
                      indicator(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Container(
                      height: 25.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(5.r)),
                    ),
                    const Spacer(),
                    Container(
                      height: 25.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(5.r)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const TrendingNewsLoadingTiles();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Container indicator() {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 18.w,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4)),
    );
  }
}
