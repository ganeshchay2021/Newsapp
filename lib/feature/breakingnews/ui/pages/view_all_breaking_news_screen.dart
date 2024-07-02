import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/feature/breakingnews/bloc/breaking_news_cubit.dart';
import 'package:newsapp/resources/news_repository.dart';
import 'package:newsapp/feature/breakingnews/ui/wedgets/view_all_breaking_news_body.dart';


class ViewAllBreakingNewsScreen extends StatelessWidget {
  const ViewAllBreakingNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BreakingNewsCubit(newsRepository: NewsRepository())..fetchBreakingNews(),
      child: const ViewAllBreakingNewsBody(
        title: "Breaking News",
      ),
    );
  }
}
