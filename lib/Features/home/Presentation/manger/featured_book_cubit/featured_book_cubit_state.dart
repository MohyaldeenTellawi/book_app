part of 'featured_book_cubit_cubit.dart';

abstract class FeaturedBookState extends Equatable {
  const FeaturedBookState();

  @override
  List<Object> get props => [];
}

class FeaturedBookCubitInitial extends FeaturedBookState {}

class FeaturedBookLoading extends FeaturedBookState {}
class FeaturedBookPaginationLoading extends FeaturedBookState {}
class FeaturedBookPaginationFailure extends FeaturedBookState {
  final String errorMessage;
 const  FeaturedBookPaginationFailure(this.errorMessage);
}
class FeaturedBookFailure extends FeaturedBookState {
  final String errorMessage;
  const FeaturedBookFailure(this.errorMessage);
}

class FeaturedBookSuccess extends FeaturedBookState {
  final List<BookEntity> books;
  const FeaturedBookSuccess(this.books);
}
