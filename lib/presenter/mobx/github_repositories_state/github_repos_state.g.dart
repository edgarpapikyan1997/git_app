// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repos_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GithubReposState on _GithubReposState, Store {
  late final _$numberAtom =
      Atom(name: '_GithubReposState.number', context: context);

  @override
  int get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(int value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  late final _$searchResultsAtom =
      Atom(name: '_GithubReposState.searchResults', context: context);

  @override
  List<RepositoryModel> get searchResults {
    _$searchResultsAtom.reportRead();
    return super.searchResults;
  }

  @override
  set searchResults(List<RepositoryModel> value) {
    _$searchResultsAtom.reportWrite(value, super.searchResults, () {
      super.searchResults = value;
    });
  }

  late final _$searchHistoryAtom =
      Atom(name: '_GithubReposState.searchHistory', context: context);

  @override
  List<RepositoryModel> get searchHistory {
    _$searchHistoryAtom.reportRead();
    return super.searchHistory;
  }

  @override
  set searchHistory(List<RepositoryModel> value) {
    _$searchHistoryAtom.reportWrite(value, super.searchHistory, () {
      super.searchHistory = value;
    });
  }

  late final _$searchFavoritesAtom =
      Atom(name: '_GithubReposState.searchFavorites', context: context);

  @override
  List<RepositoryModel> get searchFavorites {
    _$searchFavoritesAtom.reportRead();
    return super.searchFavorites;
  }

  @override
  set searchFavorites(List<RepositoryModel> value) {
    _$searchFavoritesAtom.reportWrite(value, super.searchFavorites, () {
      super.searchFavorites = value;
    });
  }

  late final _$searchRepositoriesAsyncAction =
      AsyncAction('_GithubReposState.searchRepositories', context: context);

  @override
  Future<void> searchRepositories(String query) {
    return _$searchRepositoriesAsyncAction
        .run(() => super.searchRepositories(query));
  }

  late final _$_GithubReposStateActionController =
      ActionController(name: '_GithubReposState', context: context);

  @override
  void changeNumber(int newNumber) {
    final _$actionInfo = _$_GithubReposStateActionController.startAction(
        name: '_GithubReposState.changeNumber');
    try {
      return super.changeNumber(newNumber);
    } finally {
      _$_GithubReposStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
number: ${number},
searchResults: ${searchResults},
searchHistory: ${searchHistory},
searchFavorites: ${searchFavorites}
    ''';
  }
}
