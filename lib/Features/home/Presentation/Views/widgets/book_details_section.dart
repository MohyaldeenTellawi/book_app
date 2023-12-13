import 'package:bookapp/Features/home/Presentation/Views/widgets/book_rating.dart';
import 'package:bookapp/Features/home/data/models/book_model/book_model.dart';
import 'package:bookapp/Features/home/domain/Entities/Book_Entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'Books_action.dart';

import 'custom_book_image_details.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .2),
            child: const CustomBookImage(
              imageUrl: 'imageUrl',
            )),
        const SizedBox(height: 40),
        Text('title',
            textAlign: TextAlign.center,
            style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text('authorName',
            textAlign: TextAlign.center,
            style: Styles.textStyle20
                .copyWith(color: Colors.grey, fontStyle: FontStyle.italic)),
        const SizedBox(height: 18),
        const BookRating(rating: 0, count: 0),
        const SizedBox(height: 37),
        const BooksAction(),
      ],
    );
  }
}
