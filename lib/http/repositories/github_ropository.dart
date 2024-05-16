import '../../model/repo_model.dart';
import '../dio_client/dio_client.dart';

class GitHubRepositories {
  final DioClient dioClient = DioClient();

  Future<List<RepositoryModel>> searchRepositories(String query) async {
    try {
      print("QUERY IS ========> search/repositories?q=$query");
      var response = await dioClient.dio.get('search/repositories?q=$query');
      print('RESPONSE DATA IS ==========> $response.data');
      var data = response.data['items'] as List<dynamic>;
      return data.map((repoJson) => RepositoryModel.fromJson(repoJson)).toList();
    } catch (e) {
      print('Error searching repositories: $e');
      return [];
    }
  }
}

