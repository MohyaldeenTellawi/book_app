import 'package:bookapp/Features/home/Presentation/Views/widgets/similar_books_list_view.dart';
import 'package:bookapp/Features/home/Presentation/Views/widgets/similar_books_list_view_Bloc_Consumer.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class SimilarSection extends StatelessWidget {
  const SimilarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('You can also like',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 16),
        const SimilarBooksListViewBlocConsumer(),
      ],
    );
  }
}
