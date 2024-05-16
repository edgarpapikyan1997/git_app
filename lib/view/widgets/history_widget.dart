import 'package:flutter/material.dart';
import 'package:git_app/presenter/mobx/github_repositories_state/github_repos_state.dart';
import 'package:git_app/view/widgets/repository_container.dart';
import '../../model/repo_model.dart';

class HistoryWidget extends StatelessWidget {
  final Set<RepositoryModel> repoModelSet;
  final GithubReposState githubReposState;

  const HistoryWidget(
      {Key? key, required this.repoModelSet, required this.githubReposState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          for (var entry in repoModelSet)
            RepositoryContainer(
              githubReposState: githubReposState,
              repositoryModel: entry,
              isFavorite: false,
            ),
        ],
      ),
    );
  }
}
