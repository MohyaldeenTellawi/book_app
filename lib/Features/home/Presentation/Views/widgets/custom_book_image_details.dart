import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});
 final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width:MediaQuery.of(context).size.width * .30,
        child:
        AspectRatio(
          aspectRatio: 3 / 4,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
          ),
        ),
      ),
    );
  }
}
