import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/feature/trendingnews/bloc/trending_news_cubit.dart';
import 'package:newsapp/resources/news_repository.dart';
import 'package:newsapp/feature/trendingnews/ui/widgets/view_all_trending_news_body.dart';

class ViewAllTrendingNewsScreen extends StatelessWidget {
  const ViewAllTrendingNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingNewsCubit(newsRepository: NewsRepository())
        ..fetchTrendingNews(),
      child: const ViewAllTrendingNewsBody(title: "Trending News"),
    );
  }
}
