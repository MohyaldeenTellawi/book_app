import 'package:bookapp/Features/home/data/models/book_model/book_model.dart';
import 'package:bookapp/Features/home/domain/Entities/Book_Entity.dart';
import 'package:bookapp/constants.dart';
import 'package:bookapp/core/utils/functions/lunch_url.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomButton(
              onPressed: () {},
              textButton: 'Free Pdf',
              backgroundColor: iconColor2,
              textColor: backgroundColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: ()  {
              },
              fontSize: 16,
              textButton: 'getText()',
              backgroundColor: const Color.fromRGBO(12, 70, 49, 1),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
            ),
          ),
        ],
      ),
    );
  }
   String getText(BookEntity bookEntity){
    if(bookEntity.previewLink == null){
      return 'Not Available';
    }else {
      return 'Free Preview';
    }
   }
}
