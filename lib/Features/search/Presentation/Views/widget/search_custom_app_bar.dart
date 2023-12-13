import 'package:bookapp/Features/home/Presentation/Views/widgets/featured_books_list_view.dart';
import 'package:bookapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_route.dart';
import '../../../../home/domain/Entities/Book_Entity.dart';

class SearchCustomAppBar extends StatelessWidget {
  const SearchCustomAppBar({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon:  Icon(FontAwesomeIcons.arrowLeft,
            color: iconColor,
            ))
      ],
    );
  }
}