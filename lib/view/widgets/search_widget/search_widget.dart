import 'package:flutter/material.dart';
import '../../../presenter/mobx/github_repositories_state/github_repos_state.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/extensions/extensions.dart';
import '../../../utils/assets.dart';

class SearchWidget extends StatefulWidget {
  final GithubReposState githubReposState;

  const SearchWidget({super.key, required this.githubReposState});

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

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onTapOutside: (focusNode) {
        FocusScope.of(context).unfocus();
        setState(() {
          filledColor = AppColors.layerColor;
        });
      },
      onChanged: (query) {
        widget.githubReposState.changeNumber(1);
        widget.githubReposState.searchRepositories(query);
        print(
            'SEARCH RESULTS FOR <<<$query>>> ARE >>> ${widget.githubReposState.searchResults}');
      },
      onTap: () {
        setState(() {
          filledColor = AppColors.secondaryBlue;
        });
      },
      onSubmitted: (controllerText) {
        GithubReposState().changeNumber(5);
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
    ).paddingOnly(top: 24, left: 16, right: 16);
  }
}
