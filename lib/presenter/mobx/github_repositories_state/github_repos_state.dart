import 'package:mobx/mobx.dart';
import '../../../http/repositories/github_ropository.dart';
import '../../../model/repo_model.dart';

part 'github_repos_state.g.dart';

class GithubReposState = _GithubReposState with _$GithubReposState;

abstract class _GithubReposState with Store {

  @observable
  int number = 0;


  @observable
  List<RepositoryModel> searchResults = [];

  @observable
  List<RepositoryModel> searchHistory = [];

  @observable
  List<RepositoryModel> searchFavorites = [];

  @action
  void changeNumber(int newNumber) {
    number += newNumber;
  }

  @action
  void clear() {
    searchResults = [];
  }

  @action
  Future<void> searchRepositories(String query) async {

      var results = await GitHubRepositories().searchRepositories(query);
      searchResults = results;
      print('LEAST SEARCHED >>>>>>>>>>> $query');

  }
}
