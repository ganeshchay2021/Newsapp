import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/constant/common_state.dart';
import 'package:newsapp/model/trending_news_model.dart';
import 'package:newsapp/resources/news_repository.dart';



class TrendingNewsCubit extends Cubit<CommonState> {
  final NewsRepository newsRepository;
  TrendingNewsCubit({required this.newsRepository})
      : super(CommonInitialState());

  fetchTrendingNews() async {
    emit(CommonLoadingState());
    final result = await newsRepository.fetchTrendigNews();
    result.fold((error) => emit(CommonErrorState(errorMsg: error)),
        (data) => emit(CommonSuccessState<List<News>>(news: data)));
  }
}
