import 'package:flutter/material.dart';
import 'package:git_app/presenter/mobx/github_repositories_state/github_repos_state.dart';
import 'package:git_app/view/widgets/repository_container.dart';
import '../../model/repo_model.dart';

class HistoryWidget extends StatelessWidget {
  final Set<RepositoryModel> repoModelSet;
  final GithubReposState githubReposState;

  const HistoryWidget(
      {super.key, required this.repoModelSet, required this.githubReposState});

  Set<RepositoryModel> checkHistoryAndFavorites() {
    var favorites = githubReposState.searchFavorites;
    var searchedHistory = githubReposState.searchHistory;
    Set<RepositoryModel> setOfHistory = (favorites + searchedHistory).toSet();
    return setOfHistory;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          for (var entry in repoModelSet)
            RepositoryContainer(
                githubReposState: githubReposState,
                repositoryModel: entry,
                isFavorite:githubReposState.searchFavorites
                    .any((favorite) => favorite.name == entry.name)
            ),
        ],
      ),
    );
  }
}
