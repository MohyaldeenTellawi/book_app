part of 'featured_similar_books_cubit.dart';

@immutable
abstract class FeaturedSimilarBooksState {}

class FeaturedSimilarBooksInitial extends FeaturedSimilarBooksState {}
class FeaturedSimilarBooksLoading extends FeaturedSimilarBooksState {}
class FeaturedSimilarBooksPaginationLoading extends FeaturedSimilarBooksState {}
class FeaturedSimilarBooksPaginationFailure extends FeaturedSimilarBooksState {
  final String errorMessage;
  FeaturedSimilarBooksPaginationFailure(this.errorMessage);
}
class FeaturedSimilarBooksFailure extends FeaturedSimilarBooksState {
  final String errorMessage;
  FeaturedSimilarBooksFailure(this.errorMessage);
}
class FeaturedSimilarBooksSuccess extends FeaturedSimilarBooksState {
  final List<BookEntity> books;
   FeaturedSimilarBooksSuccess(this.books);
}
