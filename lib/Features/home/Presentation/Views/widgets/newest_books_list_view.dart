
import 'package:bookapp/Features/home/Presentation/manger/newset_books_cubit/newset_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/Entities/Book_Entity.dart';
import 'newest_books_list_view_item.dart';


class NewestBooksListView extends StatefulWidget {
  const NewestBooksListView({super.key, required this.books});

  final List<BookEntity> books;
  @override
  State<NewestBooksListView> createState() => _NewestBooksListViewState();
}

class _NewestBooksListViewState extends State<NewestBooksListView> {
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
    var maxScrollLength =  _scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScrollLength ) {
      if(!isLoading){
        isLoading = true;
        await BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(
            pageIndex: nextIndex++);
        isLoading = false;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
        itemCount: widget.books.length,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: NewestBooksListViewItem(
              imageUrl: widget.books[index].imageUrl ?? '',
              title: widget.books[index].title ?? '',
              authorName: widget.books[index].authorName ?? '',
              pageCount: widget.books[index].pageCount ?? 0,
              rating: widget.books[index].rating ?? 0.0,
              downloadCount: widget.books[index].downloadCount ?? 0,
            ),
          );
        });
  }
}