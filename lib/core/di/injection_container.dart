import 'package:dio/dio.dart';
import 'package:freelancer/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/login/data/repo/login_repo.dart';
import '../networking/api_services.dart';
import '../networking/dio_factory.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Initialize Dio using DioFactory
  final dio = await DioFactory.getDio();

  // Register Dio as a singleton first
  sl.registerSingleton<Dio>(dio);

  // Register ApiServices as a singleton
  sl.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  // login
  sl.registerLazySingleton<LoginRepo>(() => LoginRepo(sl()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));
}
