import 'package:bookapp/Features/home/data/models/book_model/book_model.dart';
import 'package:bookapp/Features/search/data/repos/search_repo.dart';
import 'package:bookapp/core/errors/failures.dart';
import 'package:bookapp/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation extends SearchRepo{
   ApiService apiService;
   SearchRepoImplementation(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchListView() async {
    try {
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&q=Macos');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchResult({required String title}) {
    throw UnimplementedError();
  }

}