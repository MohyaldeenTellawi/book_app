import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {

  final num rating;
  final num count;
  final MainAxisAlignment? mainAxisAlignment;
  const BookRating({super.key, required this.rating, required this.count,this.mainAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(FontAwesomeIcons.solidStar, color: Colors.yellow, size: 14),
        const SizedBox(
          width: 6.3,
        ),
        Text(rating.toString(),
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(width: 5),
        Text('($count)',
            style: Styles.textStyle14.copyWith(color: Colors.grey))
      ],
    );
  }
}
