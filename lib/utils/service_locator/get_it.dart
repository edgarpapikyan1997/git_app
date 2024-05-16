import 'package:get_it/get_it.dart';
import 'package:git_app/presenter/mobx/github_repositories_state/github_repos_state.dart';
import '../../http/dio_client/dio_client.dart';

GetIt getIt = GetIt.instance;
void setupDependencies() {
  getIt.registerLazySingleton<DioClient>(() => DioClient());
  getIt.registerLazySingleton<GithubReposState>(() => GithubReposState());
}