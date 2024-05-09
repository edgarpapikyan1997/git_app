import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';

import '../../../model/repo_data_model/repo_data_model.dart';

class DioClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.github.com',
    ),
  );
  Future<List<RepoDataModel>> getRepositoriesWithSearchQuery(String query) async {
    final lastWeek = DateTime.now().subtract(const Duration(days: 7));
    final formattedDate = formatDate(lastWeek, [yyyy, '-', mm, '-', dd]);

    final Response response = await dio.get(
      '/search/repositories',
      queryParameters: {
        'q': query,
        'sort': 'stars',
        'order': 'desc',
        'page': '0',
        'per_page': '25',
      },
    );

    final jsonResponse = response.data;
    if (jsonResponse == null || jsonResponse['errors'] != null) {
      return [];
    }

    return RepoDataModel.mapJSONStringToList(jsonResponse['items']);
  }

  Future<List<RepoDataModel>> getTrendingRepositories() async {
    final lastWeek = DateTime.now().subtract(Duration(days: 7));
    final formattedDate = formatDate(lastWeek, [yyyy, '-', mm, '-', dd]);

    final Response response = await dio.get(
      '/search/repositories',
      queryParameters: {
        'q': 'created:>$formattedDate',
        'sort': 'stars',
        'order': 'desc',
        'page': '0',
        'per_page': '25',
      },
    );

    final jsonResponse = response.data;
    if (jsonResponse == null || jsonResponse['errors'] != null) {
      return [];
    }
    return RepoDataModel.mapJSONStringToList(jsonResponse['items']);
  }
}
