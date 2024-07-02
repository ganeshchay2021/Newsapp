import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewAllLoadingTiles extends StatelessWidget {
  const ViewAllLoadingTiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 5.w),
      child: Container(
        margin:  EdgeInsets.symmetric(vertical: 8.h),
        child: Container(
          margin:  EdgeInsets.symmetric(horizontal: 5.w),
          padding:  EdgeInsets.only(bottom: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.black26,),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 35.h,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(15.r)),
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 70.h,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(15.r)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
