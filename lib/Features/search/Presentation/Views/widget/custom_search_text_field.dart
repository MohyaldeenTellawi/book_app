import 'package:bookapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, required this.textEditingController});

  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (_)=> FocusScope.of(context).unfocus(),
      controller: textEditingController,
      style: Styles.textStyle18.copyWith(
        color: iconColor,fontWeight: FontWeight.w600
      ),
      cursorColor: iconColor,
      clipBehavior: Clip.antiAlias,
      decoration: InputDecoration(
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          hintText: 'Enter Book Name...',
          hintStyle: Styles.textStyle14.copyWith(
            color: iconColor
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon:  Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 20,
              color:iconColor,
            ),
          )),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide:  BorderSide(color: iconColor),
        borderRadius: BorderRadius.circular(15));
  }
}
