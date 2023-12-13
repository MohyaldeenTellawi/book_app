import 'package:bookapp/Features/home/Presentation/manger/featured_similar_books_cubit/featured_similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_route.dart';
import '../../../domain/Entities/Book_Entity.dart';
import 'custom_list_view_item.dart';

class SimilarBooksListView extends StatefulWidget {
  const SimilarBooksListView({super.key, required this.books});

  final List<BookEntity> books;
  @override
  State<SimilarBooksListView> createState() => _SimilarBooksListViewState();
}

class _SimilarBooksListViewState extends State<SimilarBooksListView> {
  late final ScrollController _scrollController;

  int nextIndex = 1;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    //_scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() async {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FeaturedSimilarBooksCubit>(context)
            .fetchSimilarBooks(pageIndex: nextIndex++);
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.books.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                onTap: () {},
                child: CustomListViewItem(
                  imageUrl: widget.books[index].imageUrl ?? '',
                ),
              ),
            );
          }),
    );
  }
}
