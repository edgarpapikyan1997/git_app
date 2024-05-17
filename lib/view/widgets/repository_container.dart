import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:git_app/model/repo_model.dart';
import 'package:git_app/utils/extensions/extensions.dart';

import '../../presenter/mobx/github_repositories_state/github_repos_state.dart';
import '../../utils/app_colors.dart';
import '../../utils/assets.dart';

class RepositoryContainer extends StatefulWidget {
  final RepositoryModel repositoryModel;
  final GithubReposState githubReposState;
  final bool isFavorite;

  const RepositoryContainer({
    super.key,
    required this.repositoryModel,
    required this.githubReposState,
    required this.isFavorite,
  });

  @override
  State<RepositoryContainer> createState() => _RepositoryContainerState();
}

class _RepositoryContainerState extends State<RepositoryContainer> {
  bool isFavorite = false;

  @override
  void initState() {
    if(widget.isFavorite) {
      isFavorite = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.layerColor,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 55,
        width: context.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.repositoryModel.name.isEmpty
                ? "Undefined"
                : widget.repositoryModel.name),
            GestureDetector(
              onTap: () {
                if(widget.isFavorite == false) {
                  setState(() {
                    isFavorite = !isFavorite;
                    widget.repositoryModel.isFavorite = isFavorite;
                  });
                }
                widget.githubReposState.addToFavorite(
                    isFavorite: isFavorite, query: widget.repositoryModel.name);
                print('FAVORITES ${widget.githubReposState.searchFavorites}');
              },
              child: SizedBox(
                height: 44,
                width: 44,
                child: Assets.favActive.svg(
                    color: isFavorite
                        ? AppColors.primaryBlue
                        : AppColors.placeHolderTextColor),
              ),
            )
          ],
        ).paddingSymmetric(
          horizontal: 16,
          vertical: 0,
        ),
      ).paddingOnly(bottom: 8, left: 16, right: 16);

  }
}
