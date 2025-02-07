import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart' as dio;

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton(() => dio.HttpClientAdapter);
}
