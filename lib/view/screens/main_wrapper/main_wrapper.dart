import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../../presenter/mobx/github_repositories_state/github_repos_state.dart';
import '../../../utils/assets.dart';
import '../../../utils/extensions/extensions.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/custom_app_bar/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/repository_container.dart';
import '../../widgets/search_widget/search_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  var githubReposState = GithubReposState();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(62),
        child: CustomAppBar(
          title: 'search.fitReposList'.tr(),
          teal: CustomButton(
            child: Assets.favActive.svg(),
          ).paddingOnly(right: 16),
        ),
      ),
      backgroundColor: AppColors.layerColor,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Observer(builder: (context) {
          return Container(
            height: context.height,
            width: context.width,
            color: AppColors.mainWhite,
            child: Column(
                  children: [
                    Stack(
                      children: [
                        SearchWidget(
                          githubReposState: githubReposState,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'search.searchHistory'.tr(),
                              style: context.theme.headline4,
                            ),
                          ),
                        ).paddingOnly(top: 96),
                        Align(
                          alignment: Alignment.center,
                          child: GithubReposState().searchHistory.isEmpty
                              ? Text(
                            'search.emptyHistory'.tr(),
                            textAlign: TextAlign.center,
                          ) : ListView.builder(
                            itemCount: GithubReposState().searchHistory.length,
                            itemBuilder: (context, index) {
                              var repo =
                              GithubReposState().searchHistory[index];
                              return RepositoryContainer(repoName: repo.name);
                            },
                          ),
                        ).paddingOnly(top: 299),
                      ],
                    ),
                  ],
                ),
        
          ).paddingOnly(top: 4);
        }),
      ),
    );
  }
}
