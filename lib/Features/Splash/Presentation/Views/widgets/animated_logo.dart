import 'package:bookapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class animationLogo extends StatelessWidget {
  const animationLogo({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Text('Read Free Books',
                textAlign: TextAlign.center,
                style:
                    Styles.textStyle30.copyWith(fontWeight: FontWeight.bold)),
          );
        });
  }
}
