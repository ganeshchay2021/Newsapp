import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/feature/breakingnews/bloc/breaking_news_cubit.dart';
import 'package:newsapp/feature/trendingnews/bloc/trending_news_cubit.dart';
import 'package:newsapp/resources/news_repository.dart';
import 'package:newsapp/feature/dashboard/ui/widget/home_page_body.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TrendingNewsCubit(
            newsRepository: context.read<NewsRepository>(),
          )..fetchTrendingNews(),
        ),
        BlocProvider(
          create: (context) => BreakingNewsCubit(newsRepository: context.read<NewsRepository>())..fetchBreakingNews(),
        ),
      ],
      child: const MyHomePageBody(),
    );
  }
}
