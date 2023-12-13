
import 'package:bookapp/Features/search/Presentation/Views/widget/search_custom_app_bar.dart';
import 'package:bookapp/Features/search/Presentation/manger/search_result_cubit/search_result_cubit.dart';
import 'package:bookapp/core/utils/styles.dart';
import 'package:bookapp/core/widgets/custom_error_widget.dart';
import 'package:bookapp/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/Presentation/Views/widgets/newest_books_list_view_item.dart';
import '../../../../home/domain/Entities/Book_Entity.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
   SearchViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
           SearchCustomAppBar(),
           CustomSearchTextField(
             textEditingController: TextEditingController(),
           ),
          const SizedBox(height: 16),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Search Result:',
                style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w500),
              )),
          const SizedBox(height: 10),
           const Expanded(child:
           SearchResultListView())
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchResultCubit,SearchResultState>(
      builder: (context,state){
        if(state is SearchResultSuccess){
          return ListView.builder(
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return  Padding(
                    padding:  const  EdgeInsets.symmetric(vertical: 10),
                    child:
                   Text('data'),
                  );
                });
        }else if(state is SearchResultFailure){
        return CustomErrorWidget(errorMessage: state.errorMessage);
        }else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}


