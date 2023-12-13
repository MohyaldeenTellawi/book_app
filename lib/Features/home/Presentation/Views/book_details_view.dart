import 'package:bookapp/Features/home/Presentation/Views/widgets/book_details_view_body.dart';
import 'package:bookapp/Features/home/Presentation/manger/featured_similar_books_cubit/featured_similar_books_cubit.dart';
import 'package:bookapp/Features/home/data/models/book_model/book_model.dart';
import 'package:bookapp/Features/home/domain/Entities/Book_Entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key});

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  final List<BookEntity> books = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: BookDetailsViewBody()),
    );
  }
}
