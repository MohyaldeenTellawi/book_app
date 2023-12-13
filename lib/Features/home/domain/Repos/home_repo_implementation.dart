
import 'package:bookapp/Features/home/data/data_sources/local_data_source/home_local_data_source.dart';
import 'package:bookapp/Features/home/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:bookapp/Features/home/domain/Entities/Book_Entity.dart';
import 'package:bookapp/Features/home/domain/Repos/home_repo.dart';
import 'package:bookapp/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


class HomeRepoImplementation implements  HomeRepo{

final HomeRemoteDataSource homeRemoteDataSource;
final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImplementation({required this.homeRemoteDataSource,required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageIndex=0}) async {
    try{
      List<BookEntity> books;
       books = homeLocalDataSource.fetchFeaturedBooks(
         pageIndex: pageIndex
       );
      if (books.isNotEmpty){
        return right(books);
      }
       books = await homeRemoteDataSource.fetchFeaturedBooks(
         pageIndex: pageIndex
       );
      return right(books);
    }catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({int pageIndex = 0}) async {
   try{
     List<BookEntity> books;
      books = homeLocalDataSource.fetchNewestBooks(
        pageIndex : pageIndex
      );
     if(books.isNotEmpty){
       return right(books);
     }
      books = await homeRemoteDataSource.fetchNewestBooks();
     return right(books);
   }catch(e){
     if(e is DioException) {
       return left(ServerFailure(e.toString()));
     } else {
       return left(ServerFailure(e.toString()));
     }
   }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({int pageIndex = 0}) async {
    try{
      List<BookEntity> books;
      books = homeLocalDataSource.fetchSimilarBooks(
          pageIndex: pageIndex
      );
      if (books.isNotEmpty){
        return right(books);
      }
      books = await homeRemoteDataSource.fetchSimilarBooks(
          pageIndex: pageIndex
      );
      return right(books);
    }catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }


}

 /*
@override
Future<Either<Failure, List<BookModel>>> fetchNewsetBooks() async {
  try {
    var data = await apiService.get(
        endPoint:
        'volumes?Filtering=free-ebooks&q=Apple');
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
Future<Either<Failure, List<BookModel>>> fetchFeatureBooks() async {
  try {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=Macos');
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
Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async {
  try {
    var data = await apiService.get(
        endPoint:
        'volumes?Filtering=free-ebooks&Sorting=relevance &q=Object Oriented');
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
 */