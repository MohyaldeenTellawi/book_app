import 'package:bloc/bloc.dart';
import 'package:bookapp/Features/home/domain/Entities/Book_Entity.dart';
import 'package:bookapp/Features/home/domain/Repos/home_repo.dart';
import 'package:bookapp/Features/home/domain/use_cases/fetch_similar_books_use_case.dart';

import 'package:meta/meta.dart';

import '../../../data/models/book_model/book_model.dart';

part 'featured_similar_books_state.dart';

class FeaturedSimilarBooksCubit extends Cubit<FeaturedSimilarBooksState> {
  FeaturedSimilarBooksCubit(this.fetchSimilarBooksUseCase) : super(FeaturedSimilarBooksInitial());

  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;

  Future<void> fetchSimilarBooks({int pageIndex = 0}) async {
    if(pageIndex == 0){
      emit(FeaturedSimilarBooksLoading());
    }else {
      emit(FeaturedSimilarBooksPaginationLoading());
    }
    var result = await fetchSimilarBooksUseCase.call(pageIndex);
    result.fold((failure) {
      if(pageIndex == 0){
        emit(FeaturedSimilarBooksFailure(failure.errorMessage));
      }else {
        emit(FeaturedSimilarBooksPaginationFailure(failure.errorMessage));
      }
    }, (books) {
      emit(FeaturedSimilarBooksSuccess(books));
    });
  }
}
