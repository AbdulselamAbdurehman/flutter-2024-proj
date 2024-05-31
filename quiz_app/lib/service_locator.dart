// import all necessary packages
// import 'package:get_it/get_it.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:quiz_app/features/auth/data/datasources/auth_local_datasource.dart';
// import 'package:quiz_app/features/auth/data/datasources/auth_remote_datasource.dart';
// import 'package:quiz_app/features/auth/data/repositories/auth_repository_impl.dart';
// import 'package:quiz_app/features/auth/domain/repositories/auth_repository.dart';
// import 'package:quiz_app/features/auth/presentation/bloc/auth_bloc.dart';

// final serviceLocator = GetIt.instance;

// Future<void> init() async {
//   // External dependencies
//   final sharedPreferences = await SharedPreferences.getInstance();
//   serviceLocator
//     ..registerLazySingleton<SharedPreferences>(() => sharedPreferences)

//     // Data sources
//     ..registerLazySingleton<AuthLocalDataSource>(
//         () => AuthLocalDataSource(sharedPreferences: serviceLocator()));

//   serviceLocator.registerLazySingleton<AuthRemoteDataSource>(() =>
//       AuthRemoteDataSource(
//           baseURL: 'http://localhost:3000', localDataSource: serviceLocator()));

//   // Repositories
//   serviceLocator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
//         authLocalDataSource: serviceLocator(),
//         authRemoteDataSource: serviceLocator(),
//       ));
//   // Blocs
//   serviceLocator.registerFactory(() => AuthBloc(repository: serviceLocator()));
// }


//  check 123