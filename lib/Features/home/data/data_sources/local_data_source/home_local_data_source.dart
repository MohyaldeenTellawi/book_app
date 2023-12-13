

import 'package:bookapp/constants.dart';
import 'package:hive/hive.dart';

import '../../../domain/Entities/Book_Entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageIndex=0});
  List<BookEntity> fetchNewestBooks({int pageIndex = 0});
  List<BookEntity> fetchSimilarBooks({int pageIndex=0});
}

 class HomeLocalDataSourceImplementation extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageIndex=0}) {
    int startIndex = pageIndex * 10;
    int endIndex = (pageIndex + 1) * 10;
    var box = Hive.box<BookEntity>(kFeaturedBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length){
      return [];
    }
     return box.values.toList().sublist(startIndex,endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageIndex = 0}) {
    int startIndex = pageIndex * 10;
    int endIndex = (pageIndex + 1) * 10;
    var box = Hive.box<BookEntity>(kNewestBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchSimilarBooks({int pageIndex = 0}) {
    int startIndex = pageIndex * 10;
    int endIndex = (pageIndex + 1) * 10;
    var box = Hive.box<BookEntity>(kSimilarBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length){
      return [];
    }
    return box.values.toList().sublist(startIndex,endIndex);
  }

}