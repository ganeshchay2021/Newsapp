import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/constant/common_state.dart';
import 'package:newsapp/model/trending_news_model.dart';
import 'package:newsapp/resources/news_repository.dart';


class CategoryNewsCubit extends Cubit<CommonState> {
  final NewsRepository newsRepository;
  CategoryNewsCubit({required this.newsRepository})
      : super(CommonInitialState());

  fetchCategoryNews(String categoryName) async {
    emit(CommonInitialState());
    final result = await newsRepository.fetchCategoryNews(categoryName);
    result.fold(
      (error) => emit(
        CommonErrorState(errorMsg: error),
      ),
      (data) => emit(
        CommonSuccessState<List<News>>(news: data),
      ),
    );
  }
}
