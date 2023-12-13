import 'package:bookapp/Features/home/data/data_sources/local_data_source/home_local_data_source.dart';
import 'package:bookapp/Features/home/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:bookapp/Features/home/domain/Repos/home_repo_implementation.dart';
import 'package:bookapp/Features/search/data/repos/search_repo_implementation.dart';
import 'package:bookapp/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(
        homeRemoteDataSource: HomeRemoteDataSourceImplementation(getIt.get<ApiService>()),
        homeLocalDataSource: HomeLocalDataSourceImplementation())
  );
  getIt.registerSingleton<SearchRepoImplementation>(SearchRepoImplementation(getIt.get<ApiService>()));
}
