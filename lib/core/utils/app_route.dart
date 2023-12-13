import 'package:bookapp/Features/Splash/Presentation/Views/Splash_View.dart';
import 'package:bookapp/Features/home/Presentation/Views/Home_View.dart';
import 'package:bookapp/Features/home/Presentation/Views/book_details_view.dart';
import 'package:bookapp/Features/home/Presentation/manger/featured_similar_books_cubit/featured_similar_books_cubit.dart';
import 'package:bookapp/Features/home/data/models/book_model/book_model.dart';
import 'package:bookapp/Features/home/domain/Repos/home_repo_implementation.dart';
import 'package:bookapp/Features/search/Presentation/manger/search_result_cubit/search_result_cubit.dart';
import 'package:bookapp/Features/search/data/repos/search_repo_implementation.dart';
import 'package:bookapp/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/home/domain/Entities/Book_Entity.dart';
import '../../Features/search/Presentation/Views/search_view.dart';

abstract class AppRoute {
  static const kHomeView = '/homeView';
  static const kBookViewDetails = '/bookDetailsView';
  static const kSearchView = '/SearchView';
  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
    GoRoute(path: kSearchView, builder: (context, state) => const SearchView()),
    GoRoute(
        path: kBookViewDetails,
        builder: (context, state) => BlocProvider(
            create: (context)=>FeaturedSimilarBooksCubit(getIt.get()),
            child:   const BookDetailsView())),
  ]);
}
