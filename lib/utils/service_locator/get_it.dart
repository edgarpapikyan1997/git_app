import 'package:get_it/get_it.dart';
import '../../http/dio_client/dio_client.dart';

GetIt getIt = GetIt.instance;
void setupDependencies() {
  getIt.registerLazySingleton<DioClient>(() => DioClient());
}