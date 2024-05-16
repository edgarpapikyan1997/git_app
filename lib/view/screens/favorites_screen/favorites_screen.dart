import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:git_app/utils/extensions/extensions.dart';
import 'package:git_app/view/widgets/repository_container.dart';
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
      body: SingleChildScrollView(
          child: Container(
            height: context.height,
            width: context.width,
            color: AppColors.mainWhite,
            child: githubReposState.searchFavorites.isNotEmpty ? Column(
              children: [
                RepositoryContainer(
                    repositoryModel: githubReposState.searchFavorites[0],
                    githubReposState: githubReposState,
                  isFavorite: true,
                )
              ],
            ) : Center(
              child: SizedBox(
                child: Text(
                  'favorites.noFavorites'.tr(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
      ).paddingOnly(top: 4),
    ),);
  }
}
