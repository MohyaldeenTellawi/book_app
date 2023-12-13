

import 'package:bookapp/Features/home/domain/Repos/home_repo.dart';
import 'package:bookapp/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../Entities/Book_Entity.dart';



class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>,int>{
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call(param) async {
    return  await homeRepo.fetchFeaturedBooks(
      pageIndex: param
    );
  }



}