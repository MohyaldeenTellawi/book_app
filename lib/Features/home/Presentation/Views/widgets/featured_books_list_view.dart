import 'package:bookapp/Features/home/Presentation/Views/widgets/custom_list_view_item.dart';
import 'package:bookapp/Features/home/Presentation/manger/featured_book_cubit/featured_book_cubit_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../domain/Entities/Book_Entity.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<StatefulWidget> createState() => _FeaturedBooksListViewState();


}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
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
       await BlocProvider.of<FeaturedBookCubit>(context).fetchFeaturedBooks(
            pageIndex: nextIndex++);
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.books.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CustomListViewItem(
              imageUrl: widget.books[index].imageUrl ?? '',
            ),
          );
        },
      ),
    );
  }
}
