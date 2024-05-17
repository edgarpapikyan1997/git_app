import 'package:mobx/mobx.dart';
import '../../../http/repositories/github_ropository.dart';
import '../../../model/repo_model.dart';

part 'github_repos_state.g.dart';

class GithubReposState = _GithubReposState with _$GithubReposState;

abstract class _GithubReposState with Store {
  @observable
  List<RepositoryModel> searchResults = [];

  @observable
  List<RepositoryModel> searchHistory = [];

  @observable
  List<RepositoryModel> searchFavorites = [];

  @observable
  bool isFavorite = false;

  @action
  void clear() {
    searchResults = [];
  }

  @action
  Future<void> addToFavorite(
      {required bool isFavorite, required String query}) async {
    if (isFavorite) {
      for (var favoriteItem in searchHistory) {
        if (favoriteItem.name == query) {
          searchFavorites.add(favoriteItem);
          break;
        }
      }
    } else {
      searchFavorites.removeWhere((element) => element.name == query);
    }
  }

  @action
  Future<void> searchRepositories(String query) async {
    var results = await GitHubRepositories().searchRepositories(query);
    searchResults = results;
  }

  @action
  Future<void> addToHistory(int index) async {
    if (searchResults.isNotEmpty) {
      searchHistory.add(searchResults[index]);
    }
  }
}
