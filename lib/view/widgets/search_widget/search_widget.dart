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

  const SearchWidget({super.key, required this.githubReposState});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController searchController = TextEditingController();
  final LoadingState loadingState = LoadingState();
  FocusNode focusNode = FocusNode();
  Color filledColor = AppColors.layerColor;

  @override
  void initState() {
    super.initState();
  }

  Future<void> onChangedDuration(String query) async {
    loadingState.startLoading();
    print('LOADING STATUS >>>>>>>>>>>>> ${loadingState.isLoading}');
    if (query.isNotEmpty) {
      await widget.githubReposState.searchRepositories(query);
      await Future.delayed(const Duration(milliseconds: 300));
      loadingState.stopLoading();
      print('LOADING STATUS >>>>>>>>>>>>> ${loadingState.isLoading}');
    } else {
      widget.githubReposState.clear();
      loadingState.stopLoading();
      print('LOADING STATUS >>>>>>>>>>>>> ${loadingState.isLoading}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
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
          Container(
            decoration: BoxDecoration(
                color: AppColors.placeHolderTextColor,
                borderRadius: BorderRadius.circular(15)),
            height: loadingState.isLoading
                ? 50
                : widget.githubReposState.searchResults.isNotEmpty
                    ? 600
                    : 0,
            child: loadingState.isLoading
                ? Container(
                    color: Colors.red,
                    width: 50,
                    child: CircularProgressIndicator())
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          // color: AppColors.placeHolderTextColor,
                          borderRadius: BorderRadius.vertical(
                            top: index == 0
                                ? Radius.circular(12)
                                : Radius.circular(0),
                            bottom: index ==
                                    widget.githubReposState.searchResults
                                            .length -
                                        1
                                ? Radius.circular(12)
                                : Radius.circular(0),
                          ),
                        ),
                        height: 55,
                        width: 100,
                        child: widget.githubReposState.searchResults.isNotEmpty
                            ? Text(
                                widget
                                    .githubReposState.searchResults[index].name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                ),
                              ).paddingOnly(top: 12, left: 16)
                            : const SizedBox(),
                      );
                    },
                    itemCount: widget.githubReposState.searchResults.isNotEmpty
                        ? widget.githubReposState.searchResults.length
                        : 0,
                  ),
          ).paddingOnly(top: loadingState.isLoading ? 24 : 3),
        ],
      ).paddingOnly(top: 24, left: 16, right: 16);
    });
  }
}
