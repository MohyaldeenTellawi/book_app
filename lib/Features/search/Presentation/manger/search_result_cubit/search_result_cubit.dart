import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../home/data/models/book_model/book_model.dart';
import '../../../data/repos/search_repo.dart';

part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  final SearchRepo searchRepo;
  SearchResultCubit(this.searchRepo) : super(SearchResultInitial());

  Future<void> fetchSearchResult() async {
    emit(SearchResultLoading());
    var result = await searchRepo.fetchSearchListView();
    result.fold((failure) {
      emit(SearchResultFailure(failure.errorMessage));
    }, (books) {
      emit(SearchResultSuccess(books));
    });
  }
}
