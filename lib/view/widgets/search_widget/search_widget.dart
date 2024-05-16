import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../presenter/mobx/github_repositories_state/github_repos_state.dart';
import '../../../presenter/mobx/loading_state/loading_state.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/extensions/extensions.dart';
import '../../../utils/assets.dart';

class SearchWidget extends StatefulWidget {
  final GithubReposState githubReposState;
  final LoadingState loadingState;

  const SearchWidget(
      {super.key, required this.githubReposState, required this.loadingState});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController searchController = TextEditingController();
  FocusNode focusNode = FocusNode();
  Color filledColor = AppColors.layerColor;

  @override
  void initState() {
    super.initState();
  }

  Future<void> onChangedDuration(String query) async {
    widget.loadingState.startLoading();
    print('LOADING STATUS >>>>>>>>>>>>> ${widget.loadingState.isLoading}');
    if (query.isNotEmpty) {
      await widget.githubReposState.searchRepositories(query);
      // await Future.delayed(const Duration(milliseconds: 300));
      widget.loadingState.stopLoading();
      print('LOADING STATUS >>>>>>>>>>>>> ${widget.loadingState.isLoading}');
    } else {
      widget.githubReposState.clear();
      widget.loadingState.stopLoading();
      print('LOADING STATUS >>>>>>>>>>>>> ${widget.loadingState.isLoading}');
    }
  }

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          TextField(
            controller: searchController,
            onTapOutside: (focusNode) {
              FocusScope.of(context).unfocus();
              setState(() {
                filledColor = AppColors.layerColor;
              });
            },
            onChanged: (query) async {
              searchController.clear();
              searchController.text = query;
              onChangedDuration(query);
              print(
                  'SEARCH RESULTS FOR <<<$query>>> ARE >>> ${widget.githubReposState.searchResults}');
            },
            onTap: () {
              setState(() {
                filledColor = AppColors.secondaryBlue;
              });
            },
            onSubmitted: (query) {
              searchController.clear();
              searchController.text = query;
              if (query.isNotEmpty) {
                widget.githubReposState.searchRepositories(query);
              } else {
                widget.githubReposState.clear();
              }
            },
            decoration: InputDecoration(
              prefixIcon: Assets.search
                  .svg(color: AppColors.primaryBlue)
                  .paddingOnly(left: 16, right: 10),
              suffixIcon: filledColor == AppColors.secondaryBlue
                  ? GestureDetector(
                      child: Assets.close
                          .svg(color: AppColors.primaryBlue)
                          .paddingOnly(right: 16),
                      onTap: () {
                        widget.githubReposState.clear();
                        searchController.clear();
                      },
                    )
                  : const SizedBox(),
              filled: true,
              fillColor: filledColor,
              focusColor: AppColors.primaryBlue,
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(width: 3, color: AppColors.primaryBlue),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(width: 3, color: AppColors.mainWhite),
              ),
            ),
          ),
        ],
      ).paddingOnly(top: 24, left: 16, right: 16);
  }
}
