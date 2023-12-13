import 'package:bookapp/Features/home/Presentation/Views/widgets/similar_books_list_view.dart';
import 'package:bookapp/Features/home/Presentation/manger/featured_similar_books_cubit/featured_similar_books_cubit.dart';
import 'package:bookapp/core/utils/app_route.dart';
import 'package:bookapp/core/widgets/custom_error_widget.dart';
import 'package:bookapp/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/Entities/Book_Entity.dart';
import 'custom_list_view_item.dart';

class SimilarBooksListViewBlocConsumer extends StatefulWidget {
  const SimilarBooksListViewBlocConsumer({super.key});

  @override
  State<SimilarBooksListViewBlocConsumer> createState() =>
      _SimilarBooksListViewBlocConsumerState();
}

class _SimilarBooksListViewBlocConsumerState
    extends State<SimilarBooksListViewBlocConsumer> {
  final List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedSimilarBooksCubit, FeaturedSimilarBooksState>(
      listener: (context, state) {
        if (state is FeaturedSimilarBooksSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is FeaturedSimilarBooksSuccess ||
            state is FeaturedSimilarBooksPaginationLoading ||
            state is FeaturedSimilarBooksPaginationFailure) {
          return SimilarBooksListView(
            books: books,
          );
        } else if (state is FeaturedSimilarBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
