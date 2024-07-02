// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/feature/categorynews/bloc/category_news_cubit.dart';
import 'package:newsapp/resources/news_repository.dart';
import 'package:newsapp/feature/categorynews/ui/pages/category_news_page.dart';
import 'package:page_transition/page_transition.dart';

class CategoryTiles extends StatelessWidget {
  const CategoryTiles({
    Key? key,
    required this.categoryName,
    required this.image,
  }) : super(key: key);
  final String? image;
  final String? categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(PageTransition(
            child: BlocProvider(
              create: (context) => CategoryNewsCubit(
                  newsRepository: context.read<NewsRepository>())
                ..fetchCategoryNews(categoryName!.toLowerCase()),
              child: CategoryNewsPage(
                title: categoryName!,
              ),
            ),
            type: PageTransitionType.fade));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16.w),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                image!,
                width: 110.w,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.black26,
              ),
              width: 110.w,
              height: 70.h,
              child: Center(
                child: Text(
                  categoryName!,
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
