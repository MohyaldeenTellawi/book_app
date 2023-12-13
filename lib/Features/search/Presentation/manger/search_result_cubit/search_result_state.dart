part of 'search_result_cubit.dart';

@immutable
abstract class SearchResultState {}

class SearchResultInitial extends SearchResultState {}
class SearchResultLoading extends SearchResultState {}
class SearchResultFailure extends SearchResultState {
  final String errorMessage;
  SearchResultFailure(this.errorMessage);
}
class SearchResultSuccess extends SearchResultState {
  final List<BookModel> books;
  SearchResultSuccess(this.books);
}
