

 import 'package:bookapp/Features/home/data/models/book_model/book_model.dart';
import 'package:bookapp/constants.dart';
import 'package:bookapp/core/utils/api_service.dart';
import '../../../../../core/utils/functions/save_box_data.dart';
import '../../../domain/Entities/Book_Entity.dart';

abstract class HomeRemoteDataSource {
   Future<List<BookEntity>> fetchFeaturedBooks({int pageIndex=0});
   Future<List<BookEntity>>  fetchNewestBooks({int pageIndex = 0});
   Future<List<BookEntity>> fetchSimilarBooks({int pageIndex = 0});
}

 class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImplementation(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageIndex=0}) async {
    var data =  await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=Programming&startIndex=${pageIndex *10}');
    List<BookEntity> books =  getBookList(data);
    savaBoxData(books, kFeaturedBox);
    return books;
    
  }
  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageIndex = 0}) async {
    var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=Programming&startIndex=${pageIndex *10}');
    List<BookEntity> books = getBookList(data);
    savaBoxData(books, kNewestBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({int pageIndex = 0}) async {
    var data =  await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=Programming&startIndex=${pageIndex *10}');
    List<BookEntity> books =  getBookList(data);
    savaBoxData(books, kSimilarBox);
    return books;
  }
  List<BookEntity> getBookList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for(var bookMap in data['items']){
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
 }