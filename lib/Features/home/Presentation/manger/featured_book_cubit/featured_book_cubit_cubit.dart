import 'package:bloc/bloc.dart';
import 'package:bookapp/Features/home/domain/Entities/Book_Entity.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/use_cases/fetch_featured_books_use_cases.dart';
part 'featured_book_cubit_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  FeaturedBookCubit(this.featuredBooksUseCase) : super(FeaturedBookCubitInitial());

  Future<void> fetchFeaturedBooks({int pageIndex=0}) async {
    if(pageIndex == 0){
      emit(FeaturedBookLoading());
    } else {
       emit(FeaturedBookPaginationLoading());
    }
    var result = await featuredBooksUseCase.call(
        pageIndex
    );
    result.fold((failure) {
      if(pageIndex == 0){
        emit(FeaturedBookFailure(failure.errorMessage));
      }else {
        emit(FeaturedBookPaginationFailure(failure.errorMessage));
      }
    }, (books) {
      emit(FeaturedBookSuccess(books));
    });
  }
}
