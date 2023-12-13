

import 'package:bookapp/constants.dart';
import 'package:bookapp/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> freePreviewAndPdfLauncher(context, String? url) async {
  if(url != null){
    Uri uRl = Uri.parse(url);
    if (await canLaunchUrl(uRl)){
      await launchUrl(uRl);
    }else {
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
             child: Text('Not Available',
             textAlign: TextAlign.center,
             style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w600,color:iconColor2),
             ),
           ))
     );
    }
  }
 }