import 'package:bookapp/Features/home/Presentation/manger/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookapp/core/widgets/custom_error_widget.dart';
import 'package:bookapp/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/Entities/Book_Entity.dart';
import 'newest_books_list_view.dart';

class NewestBooksListViewBlocConsumer extends StatefulWidget {
  const NewestBooksListViewBlocConsumer({super.key});

  @override
  State<NewestBooksListViewBlocConsumer> createState() => _NewestBooksListViewBlocConsumerState();
}

class _NewestBooksListViewBlocConsumerState extends State<NewestBooksListViewBlocConsumer> {

  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewsetBooksState>(
      listener: (context,state){
        if (state is NewestBooksSuccess){
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess || state is NewestBooksPaginationLoading || state is NewestBooksPaginationFailure) {
          return  NewestBooksListView(
            books: books,
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}


