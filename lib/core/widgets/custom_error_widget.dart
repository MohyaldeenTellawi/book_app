import 'package:bookapp/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
  const CustomErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        backgroundColor: Colors.redAccent,
        titlePadding: const EdgeInsets.all(30),
        titleTextStyle: Styles.textStyle18.copyWith(color: Colors.white,fontWeight: FontWeight.w600),
        title: Center(child: Text(errorMessage)),
      ),
    );
  }
}
