import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:git_app/presenter/mobx/loading_state/loading_state.dart';
import 'package:git_app/view/widgets/history_widget.dart';
import '../../../presenter/mobx/github_repositories_state/github_repos_state.dart';
import '../../../utils/assets.dart';
import '../../../utils/extensions/extensions.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/go_router/go_router.dart';
import '../../widgets/custom_app_bar/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/search_widget/search_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../widgets/search_widget/suggsetion_container_animated.dart';


class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final GithubReposState githubReposState = GetIt.instance<GithubReposState>();
  final LoadingState loadingState = LoadingState();
  final double height = 44;
  final double width = 44;


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
            height: height,
            width: width,
            onTap: () {
              router.go('/favorites_screen');
            },
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
                SearchWidget(
                  githubReposState: githubReposState,
                  loadingState: loadingState,
                ),
                githubReposState.searchResults.isNotEmpty
                    ? Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: loadingState.isLoading
                                    ? AppColors.pureWhite
                                    : AppColors.secondaryBlue,
                                borderRadius: BorderRadius.circular(15)),
                            height: loadingState.isLoading
                                ? 50
                                : githubReposState.searchResults.isNotEmpty
                                    ? 600
                                    : 0,
                            child: Container(
                              child: loadingState.isLoading
                                  ? const ColoredBox(
                                      color: AppColors.mainWhite,
                                      child: CupertinoActivityIndicator())
                                  : ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return SuggestionContainerAnimated(
                                          index: index,
                                          githubReposState: githubReposState,
                                        );
                                      },
                                      itemCount: githubReposState
                                              .searchResults.isNotEmpty
                                          ? githubReposState
                                              .searchResults.length
                                          : 0,
                                    ),
                            ),
                          ).paddingOnly(
                              top: loadingState.isLoading ? 24 : 3,
                              left: 16,
                              right: 16),

                          ///Need to be separated as independent widget
                          loadingState.isLoading
                              ? const SizedBox()
                              : Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      githubReposState.clear();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.secondaryBlue,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      height: 30,
                                      width: 100,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('search.clear'.tr()),
                                          Assets.close.svg(
                                              color: AppColors.primaryBlue),
                                        ],
                                      ),
                                    ),
                                  ),
                                ).paddingOnly(right: 16, top: 5)
                        ],
                      )
                    : Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'search.searchHistory'.tr(),
                                style: context.theme.headline4,
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: githubReposState.searchHistory.isEmpty
                                  ? Text(
                                      'search.emptyHistory'.tr(),
                                      textAlign: TextAlign.center,
                                    ).paddingOnly(top: 184)
                                  : HistoryWidget(
                                      githubReposState: githubReposState,
                                      repoModelSet: githubReposState
                                          .searchHistory
                                          .toSet())),
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
