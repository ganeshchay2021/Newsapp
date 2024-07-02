// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FeaturedIndicator extends StatefulWidget {
  const FeaturedIndicator({
    Key? key,
    required this.index,
    required this.count,
  }) : super(key: key);
  final int index;
  final int count;

  @override
  State<FeaturedIndicator> createState() => _FeaturedIndicatorState();
}

class _FeaturedIndicatorState extends State<FeaturedIndicator> {
  @override
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: AnimatedSmoothIndicator(
        activeIndex: widget.index,
        count: 3,
        axisDirection: Axis.horizontal,
        effect: WormEffect(
          paintStyle: PaintingStyle.fill,
          dotHeight: 13.h,
          dotWidth: 13.h,
          spacing: 8.w,

          activeDotColor: Colors.green.shade800,
        ),
      ),
    );
  }
}
