

import 'package:bookapp/Features/home/domain/Entities/Book_Entity.dart';
import 'package:bookapp/Features/home/domain/Repos/home_repo.dart';
import 'package:bookapp/core/errors/failures.dart';
import 'package:bookapp/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUseCase extends UseCase<List<BookEntity>, int>{

  final HomeRepo homeRepo;
  FetchSimilarBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call(int param) async {
    return await homeRepo.fetchSimilarBooks(
      pageIndex: param
    );
  }
}