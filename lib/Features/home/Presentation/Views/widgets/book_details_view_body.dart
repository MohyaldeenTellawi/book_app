import 'package:bookapp/Features/home/Presentation/Views/widgets/similar_section.dart';
import 'package:bookapp/Features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import '../../../domain/Entities/Book_Entity.dart';
import 'book_details_section.dart';
import 'book_details_custom_app_bar.dart';

class BookDetailsViewBody extends StatefulWidget {
  const BookDetailsViewBody({super.key});

  @override
  State<BookDetailsViewBody> createState() => _BookDetailsViewBodyState();
}

class _BookDetailsViewBodyState extends State<BookDetailsViewBody> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                BookDetailsCustomAppBar(),
                BookDetailsSection(),
                Expanded(child: SizedBox(height: 50)),
                SimilarSection(),
                SizedBox(height: 40),
              ],
            ),
          ),
        )
      ],
    );
  }
}
