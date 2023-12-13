import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/Entities/Book_Entity.dart';
import '../../../domain/use_cases/fetch_newest_books_use_case.dart';


part 'newset_books_state.dart';

class NewestBooksCubit extends Cubit<NewsetBooksState> {
  final FetchNewestBooksUseCase fetchNewestBookUseCase;
  NewestBooksCubit(this.fetchNewestBookUseCase) : super(NewestBooksInitial());

  Future<void> fetchNewestBooks({int pageIndex = 0}) async {
    if(pageIndex == 0){
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaginationLoading());
    }
    var result = await fetchNewestBookUseCase.call(pageIndex);
    result.fold((failure) {
      if(pageIndex == 0){
        emit(NewestBooksFailure(failure.errorMessage));
      }else {
        emit(NewestBooksPaginationFailure(failure.errorMessage));
      }
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
