import 'package:bookapp/constants.dart';
import 'package:bookapp/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:toast/toast.dart';
import '../../../../../core/utils/app_route.dart';

class BookDetailsCustomAppBar extends StatelessWidget {
  const BookDetailsCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRoute.kHomeView);
              },
              icon: const Icon(FontAwesomeIcons.circleXmark,
              color: iconColor2,
              )),
          IconButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        action: SnackBarAction(
                          textColor: iconColor2,
                          label: 'Close',
                          onPressed: (){},
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor:  Colors.white,
                        content: Center(
                          child: Text('Cart Is Empty',
                            textAlign: TextAlign.center,
                            style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w600,color:iconColor2),
                          ),
                        ))
                );
              }, icon:  Icon(FontAwesomeIcons.cartShopping,
          color: iconColor,
          ))
        ],
      ),
    );
  }
}
