import 'package:bookapp/Features/search/Presentation/Views/widget/search_view_body.dart';
import 'package:flutter/material.dart';

import '../../../home/domain/Entities/Book_Entity.dart';




class SearchView extends StatelessWidget{
   const SearchView({super.key});


  @override

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      body: SafeArea(
        child: SearchViewBody(

        ),
      ),
    );
  }
}
