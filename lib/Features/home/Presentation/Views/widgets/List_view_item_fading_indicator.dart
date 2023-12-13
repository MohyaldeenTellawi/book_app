import 'package:flutter/material.dart';

class CustomListViewItemFadingIndicator extends StatelessWidget {
  const CustomListViewItemFadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: Container(
            color: Colors.grey[50],
          )),
    );
  }
}
