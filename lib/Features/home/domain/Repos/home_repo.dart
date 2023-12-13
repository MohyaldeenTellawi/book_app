

import 'package:bookapp/Features/home/domain/Entities/Book_Entity.dart';
import 'package:bookapp/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<BookEntity>>> fetchFeaturedBooks({int pageIndex = 0});
  Future<Either<Failure,List<BookEntity>>> fetchNewestBooks({int pageIndex = 0});
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({int pageIndex = 0});
}