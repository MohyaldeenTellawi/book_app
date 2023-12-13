import 'package:bookapp/constants.dart';
import 'package:bookapp/core/utils/app_route.dart';
import 'package:bookapp/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, top: 70),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logo,
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 7),
          Text('Git Book',
              style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w700)),
          const Spacer(),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRoute.kSearchView);
              },
              icon:  Icon(FontAwesomeIcons.magnifyingGlass,
              color: iconColor,
              ))
        ],
      ),
    );
  }
}
