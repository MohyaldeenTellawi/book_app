import 'package:bookapp/Features/home/Presentation/manger/featured_book_cubit/featured_book_cubit_cubit.dart';
import 'package:bookapp/Features/home/Presentation/manger/featured_similar_books_cubit/featured_similar_books_cubit.dart';
import 'package:bookapp/Features/home/Presentation/manger/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookapp/Features/home/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:bookapp/Features/home/domain/Repos/home_repo_implementation.dart';
import 'package:bookapp/Features/home/domain/Entities/Book_Entity.dart';
import 'package:bookapp/Features/home/domain/use_cases/fetch_featured_books_use_cases.dart';
import 'package:bookapp/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookapp/Features/search/Presentation/manger/search_result_cubit/search_result_cubit.dart';
import 'package:bookapp/Features/search/data/repos/search_repo_implementation.dart';
import 'package:bookapp/core/utils/app_route.dart';
import 'package:bookapp/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'constants.dart';

void main() async {
  setupServiceLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  await Hive.openBox<BookEntity>(kSimilarBox);
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) {
              return  FeaturedBookCubit(
               FetchFeaturedBooksUseCase(
                 getIt.get<HomeRepoImplementation>()
               )
              )..fetchFeaturedBooks();
            }),
        BlocProvider(
            create: (context) =>
                NewestBooksCubit(
                  FetchNewestBooksUseCase(
                    getIt.get<HomeRepoImplementation>()
                  )
                )
                  ..fetchNewestBooks()),
        BlocProvider(create: (context)=>SearchResultCubit(getIt.get<SearchRepoImplementation>())
        ..fetchSearchResult()
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: backgroundColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
        routerConfig: AppRoute.router,
      ),
    );
  }
}
