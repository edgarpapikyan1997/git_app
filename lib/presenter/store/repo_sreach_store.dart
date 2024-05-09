import 'package:mobx/mobx.dart';
import '../../http/repositories/data_repository.dart';
import '../../model/repo_data_model/repo_data_model.dart';

part 'repo_search_store.g.dart';

class RepoSearchStore = _RepoSearchStore with _$RepoSearchStore;

abstract class _RepoSearchStore with Store {
  final DataRepository _dataRepository;

  _RepoSearchStore(this._dataRepository);

  @observable
  List<RepoDataModel> repos = [];

  @observable
  bool loading = false;

  @observable
  String error = '';

  @action
  Future<void> searchRepositories(String query) async {
    loading = true;
    try {
      repos = await _dataRepository.getRepositoriesWithSearchQuery(query);
      repos.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> refreshRepositories() async {
    loading = true;
    try {
      repos = await _dataRepository.getTrendingRepositories();
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false;
    }
  }

  @action
  void clearSearch() {
    repos = [];
    error = '';
  }
}
