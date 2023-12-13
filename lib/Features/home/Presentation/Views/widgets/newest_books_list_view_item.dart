
import 'package:bookapp/Features/home/Presentation/Views/widgets/custom_list_view_item.dart';
import 'package:bookapp/core/utils/app_route.dart';
import 'package:bookapp/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'book_rating.dart';

class NewestBooksListViewItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String authorName;
  final int pageCount;
  final num rating;
  final num downloadCount;
  const NewestBooksListViewItem({super.key, required this.imageUrl, required this.title, required this.authorName, required this.pageCount, required this.rating, required this.downloadCount});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      splashColor: const Color(0xff100B20),
      onTap: () {
        GoRouter.of(context).push(AppRoute.kBookViewDetails,

        );
      },
      child: SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          child: Row(
            children: [
              CustomListViewItem(
                imageUrl: imageUrl,
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle18
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(authorName,
                      style: Styles.textStyle14,
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Text(
                          'Pages($pageCount)',
                          style: Styles.textStyle18
                              .copyWith(fontWeight: FontWeight.w500,
                          color: Colors.lightGreen
                          ),
                        ),
                        const Spacer(),
                         BookRating(
                          rating: rating,
                           count: downloadCount,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
