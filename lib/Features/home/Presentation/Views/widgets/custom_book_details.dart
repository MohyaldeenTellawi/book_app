import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class CustomBookDetails extends StatelessWidget {
  const CustomBookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('The Jungle Book',
            style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text('Rudyard Kipling',
            style: Styles.textStyle20
                .copyWith(color: Colors.grey, fontStyle: FontStyle.italic)),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              FontAwesomeIcons.solidStar,
              color: Colors.yellow,
              size: 14,
            ),
            const SizedBox(
              width: 6.3,
            ),
            Text('4.8',
                style:
                    Styles.textStyle16.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(width: 5),
            Text('(2390)',
                style: Styles.textStyle14.copyWith(color: Colors.grey))
          ],
        ),
      ],
    );
  }
}
