import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:newsapp/constant/api_key.dart';
import 'package:newsapp/model/trending_news_model.dart';


class NewsRepository {
  Future<Either<String, List<News>>> fetchTrendigNews() async {
    try {
      final response = await Dio().get(
          "https://newsapi.org/v2/everything?q=apple&from=2024-06-18&to=2024-06-18&sortBy=popularity&apiKey=$apiKey");
     final data = List.from(response.data["articles"]).map((e) => News.fromMap(e)).toList();
        return right(data);
      
    } on DioException catch (e) {
      return left(e.response!.data["message"] ?? "Unable to Show News");
    } catch (e) {
      return left(e.toString());
    }
  }


  Future<Either<String, List<News>>> fetchBreakingNews()async{
    try{
      final response = await Dio().get("https://newsapi.org/v2/everything?q=tesla&from=2024-06-02&sortBy=publishedAt&apiKey=$apiKey");
      final data= List.from(response.data["articles"]).map((e) => News.fromMap(e)).toList();
      return Right(data);
    }on DioException catch(e){
      return Left(e.response!.data["message"] ?? "Unable to show data");
    }catch(e){
      return Left(e.toString());
    }
  }

  Future<Either<String, List<News>>> fetchCategoryNews(String categoryName)async{
    try{
      final response = await Dio().get("https://newsapi.org/v2/top-headlines?country=us&category=$categoryName&apiKey=cf2ca1e923f84e9f93c1c9075d165dca");
      final data= List.from(response.data["articles"]).map((e) => News.fromMap(e)).toList();
      return Right(data);
    }on DioException catch(e){
      return Left(e.response!.data["message"] ?? "Unable to show data");
    }catch(e){
      return Left(e.toString());
    }
  }
}
