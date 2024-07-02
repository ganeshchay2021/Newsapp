// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedTile extends StatefulWidget {
  const FeaturedTile({
    Key? key,
    required this.urlToImage,
    required this.title,
  }) : super(key: key);
  final String urlToImage;
  final String title;

  @override
  State<FeaturedTile> createState() => _FeaturedTileState();
}

class _FeaturedTileState extends State<FeaturedTile> {
  final cacheManager = CacheManager(
    Config("imageCached",
        stalePeriod: const Duration(days: 15), maxNrOfCacheObjects: 100,),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            
            child: CachedNetworkImage(
              
              cacheManager: cacheManager,
              key: UniqueKey(),
              imageUrl: widget.urlToImage,
              
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              placeholder: (context, url) => Container(
                color: Colors.black12,
              ),
              errorWidget:(context, url, error) => const Center(
                child: Icon(Icons.error, color: Colors.red,),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.r),
                bottomRight: Radius.circular(15.r),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            margin: EdgeInsets.only(top: 150.h),
            width: MediaQuery.of(context).size.width,
            child: Text(
              widget.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
