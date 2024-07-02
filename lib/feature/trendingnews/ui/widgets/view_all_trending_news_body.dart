import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/constant/common_state.dart';
import 'package:newsapp/feature/trendingnews/bloc/trending_news_cubit.dart';
import 'package:newsapp/feature/shimmer/ui/pages/view_all.dart';

import 'package:newsapp/model/trending_news_model.dart';
import 'package:newsapp/widgets/trending_news_category_tile.dart';

class ViewAllTrendingNewsBody extends StatelessWidget {
  const ViewAllTrendingNewsBody({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.chevron_left)),
        title: Text(
          title,
          style: const TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<TrendingNewsCubit, CommonState>(
        builder: (context, state) {
          if (state is CommonSuccessState<List<News>>) {
            return ListView.builder(
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                return TrendingNewsCategoryNewsTile(
                  news: state.news[index],
                );
              },
            );
          } else if (state is CommonErrorState) {
            return Text(state.errorMsg);
          } else {
            return const ViewAllLoading(title: "Trending News");
          }
        },
      ),
    );
  }
}
