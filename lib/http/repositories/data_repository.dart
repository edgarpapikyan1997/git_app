import 'package:get_it/get_it.dart';
import 'package:git_app/http/dio_client/dio_client.dart';
import 'package:git_app/utils/service_locator/get_it.dart'; // Assuming this file contains your setupDependencies function
import '../../model/repo_data_model/repo_data_model.dart';

GetIt getIt = GetIt.instance;

class DataRepository {
  final DioClient _dioClient = getIt<DioClient>();

  Future<List<RepoDataModel>> getTrendingRepositories() => _dioClient.getTrendingRepositories();

  Future<List<RepoDataModel>> getRepositoriesWithSearchQuery(String query) =>
      _dioClient.getRepositoriesWithSearchQuery(query);
}
