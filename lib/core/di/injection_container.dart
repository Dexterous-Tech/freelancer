import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../networking/api_services.dart';
import '../networking/dio_factory.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Initialize Dio using DioFactory
  final dio = await DioFactory.getDio();

  // Register Dio as a singleton first
  sl.registerSingleton<Dio>(dio);

  // Register ApiServices as a singleton
  sl.registerSingleton<ApiServices>(ApiServices.internal(dio));
}
