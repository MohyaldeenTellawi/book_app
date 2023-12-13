
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key, required this.imageUrl});

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return
      ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: CachedNetworkImage(
            fadeInCurve: Curves.easeIn,
            fadeInDuration: const Duration(seconds: 2),
            imageUrl: imageUrl,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => const Center(
              child: Icon(
                FontAwesomeIcons.image,
                size: 30,
              ),
            ),
          )),
    );
  }
}
