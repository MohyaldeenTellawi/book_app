

import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_fading_widget.dart';
import 'List_view_item_fading_indicator.dart';


class FeaturedListViewFadingIndicator extends StatelessWidget {
  const FeaturedListViewFadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
          itemCount: 10,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5),
              child: CustomListViewItemFadingIndicator(),
            );
          },
        ),
      ),
    );
  }
}
