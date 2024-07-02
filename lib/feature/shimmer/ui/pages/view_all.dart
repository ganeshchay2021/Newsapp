// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:newsapp/feature/shimmer/ui/widget/view_all_loading_Tiles.dart';
import 'package:shimmer/shimmer.dart';

class ViewAllLoading extends StatelessWidget {
  const ViewAllLoading({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
        period: const Duration(milliseconds: 700),
        direction: ShimmerDirection.ltr,
        baseColor: Colors.black26,
        highlightColor: const Color.fromRGBO(255, 255, 255, 1),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const ViewAllLoadingTiles();
          },
        ),
      ),
    );
  }
}
