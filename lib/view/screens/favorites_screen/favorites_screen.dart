import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:git_app/utils/extensions/extensions.dart';
import 'package:git_app/view/widgets/repository_container.dart';
import '../../../model/repo_model.dart';
import '../../../presenter/mobx/github_repositories_state/github_repos_state.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/assets.dart';
import '../../../utils/go_router/go_router.dart';
import '../../widgets/custom_app_bar/custom_app_bar.dart';
import '../../widgets/custom_button.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final GithubReposState githubReposState = GetIt.instance<GithubReposState>();
  Set<RepositoryModel> repoModelSet = {};

  @override
  void initState() {
    super.initState();
    repoModelSet = githubReposState.searchFavorites.toSet();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.layerColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(62),
        child: CustomAppBar(
          leading: Align(
            alignment: Alignment.center,
            child: CustomButton(
              height: 44,
              width: 44,
              onTap: () {
                router.pop();
              },
              child: Assets.left.svg(),
            ).paddingOnly(left: 15),
          ),
          title: 'favorites.favReposList'.tr(),
        ),
      ),
      body: Container(
        height: context.height,
        width: context.width,
        color: AppColors.layerColor,
        child: ColoredBox(
          color: AppColors.mainWhite,
          child:  githubReposState.searchFavorites.isNotEmpty ? SingleChildScrollView(
            child: Column(
              children: [
                for (var entry in repoModelSet)
                  RepositoryContainer(
                    githubReposState: githubReposState,
                    repositoryModel: entry,
                    isFavorite: true,
                  ),
              ],
            ).paddingOnly(top: 24),
          ) : Center(
            child: SizedBox(
              child: Text(
                'favorites.noFavorites'.tr(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
            ).paddingOnly(top: 4),);
  }
}
