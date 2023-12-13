part of 'newset_books_cubit.dart';

abstract class NewsetBooksState extends Equatable {
  const NewsetBooksState();

  @override
  List<Object> get props => [];
}

class NewestBooksInitial extends NewsetBooksState {}

class NewestBooksLoading extends NewsetBooksState {}

class NewestBooksPaginationLoading extends NewsetBooksState {}

class NewestBooksPaginationFailure extends NewsetBooksState {
  final String errorMessage;
  const NewestBooksPaginationFailure(this.errorMessage);}

class NewestBooksFailure extends NewsetBooksState {
  final String errorMessage;
  const NewestBooksFailure(this.errorMessage);
}

class NewestBooksSuccess extends NewsetBooksState {
  final List<BookEntity> books;
  const NewestBooksSuccess(this.books);
}
