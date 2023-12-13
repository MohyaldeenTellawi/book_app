

import 'package:bookapp/Features/home/domain/Repos/home_repo.dart';
import 'package:bookapp/Features/home/domain/Entities/Book_Entity.dart';
import 'package:bookapp/core/errors/failures.dart';
import 'package:bookapp/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;
  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call(param) async {
    return await homeRepo.fetchNewestBooks(
      pageIndex: param
    );
  }

}