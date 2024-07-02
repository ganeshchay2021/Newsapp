import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/constant/common_state.dart';
import 'package:newsapp/feature/categorynews/ui/widgets/category_tile.dart';
import 'package:newsapp/feature/trendingnews/bloc/trending_news_cubit.dart';
import 'package:newsapp/feature/breakingnews/ui/pages/view_all_breaking_news_screen.dart';
import 'package:newsapp/feature/dashboard/ui/widget/homefeaturedsection.dart';
import 'package:newsapp/feature/trendingnews/ui/pages/view_all_trending_news_screen.dart';
import 'package:newsapp/feature/trendingnews/ui/widgets/trending_news_tiles.dart';
import 'package:newsapp/feature/shimmer/ui/pages/home_page_loading.dart';
import 'package:newsapp/model/trending_news_model.dart';

import 'package:page_transition/page_transition.dart';

class MyHomePageBody extends StatefulWidget {
  const MyHomePageBody({super.key});

  @override
  State<MyHomePageBody> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageBody> {
  final List catergory = [
    ["assets/images/business.jpg", "Business"],
    ["assets/images/entertainment.jpg", "Entertainment"],
    ["assets/images/sport.jpg", "Sports"],
    ["assets/images/health.jpg", "Health"],
    ["assets/images/general.jpg", "politics"],
  ];

  int loadItems=10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "News",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<TrendingNewsCubit, CommonState>(
        builder: (context, state) {
          if (state is CommonSuccessState<List<News>>) {
            return SingleChildScrollView(
              child: SizedBox(
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
                        itemCount: catergory.length,
                        itemBuilder: (context, index) {
                          return CategoryTiles(
                              categoryName: catergory[index][1],
                              image: catergory[index][0]);
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
                          Text(
                            "Breaking News!",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(PageTransition(
                                  child: const ViewAllBreakingNewsScreen(),
                                  type: PageTransitionType.fade));
                            },
                            child: Text(
                              "View All",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade400),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    const HomeFeaturedSection(),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        children: [
                          Text(
                            "Trending News!",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                PageTransition(
                                    child: const ViewAllTrendingNewsScreen(),
                                    type: PageTransitionType.fade),
                              );
                            },
                            child: Text(
                              "View All",
                              style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade400),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Column(
                      children: List.generate(15, (index) {
                        return TrendingNewsTile(
                          news: state.news[index],
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const HomePageLoading();
          }
        },
      ),
    );
  }
}
