import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/constant/common_state.dart';
import 'package:newsapp/feature/breakingnews/bloc/breaking_news_cubit.dart';

import 'package:newsapp/feature/dashboard/ui/widget/featured_indicator.dart';
import 'package:newsapp/feature/dashboard/ui/widget/featured_tile.dart';
import 'package:newsapp/model/trending_news_model.dart';

class HomeFeaturedSection extends StatefulWidget {
  const HomeFeaturedSection({super.key});

  @override
  State<HomeFeaturedSection> createState() => _HomeFeaturedSectionState();
}

class _HomeFeaturedSectionState extends State<HomeFeaturedSection> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreakingNewsCubit, CommonState>(
      builder: (context, state) {
        if (state is CommonSuccessState<List<News>>) {
          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: state.news.length,
                itemBuilder: (context, index, realIndex) {
                  return FeaturedTile(
                    urlToImage: state.news[index].urlToImage!,
                    title: state.news[index].title!,
                  );
                },
                options: CarouselOptions(
                  height: 200.h,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),
              Center(
                child: FeaturedIndicator(
                  index: activeIndex,
                  count: state.news.length,
                ),
              ),
            ],
          );
        } else {
          return SizedBox(
            height: 200.h,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
