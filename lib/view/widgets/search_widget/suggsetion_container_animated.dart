import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:git_app/model/repo_model.dart';
import 'package:git_app/utils/extensions/extensions.dart';

import '../../../presenter/mobx/github_repositories_state/github_repos_state.dart';
import '../../../presenter/mobx/suggestion_animation_state/suggestion_animation_state.dart';
import '../../../utils/app_colors.dart';

class SuggestionContainerAnimated extends StatefulWidget {
  final GithubReposState githubReposState;
  final int index;

  const SuggestionContainerAnimated(
      {super.key, required this.index, required this.githubReposState});

  @override
  State<SuggestionContainerAnimated> createState() =>
      _SuggestionContainerState();
}

class _SuggestionContainerState extends State<SuggestionContainerAnimated> {
  List<RepositoryModel> repositoryModelSet = [];
  SuggestionAnimationState suggestionAnimationState =
      SuggestionAnimationState();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return GestureDetector(
        onTap: () {
          suggestionAnimationState.isOpened =
              !suggestionAnimationState.isOpened;
          suggestionAnimationState.isOpened
              ? suggestionAnimationState.openContainer()
              : suggestionAnimationState.closeContainer();

          widget.githubReposState.addToHistory(widget.index);
        },
        child: AnimatedContainer(
          curve: Curves.fastOutSlowIn,
          height: suggestionAnimationState.containerHeight,
          duration: const Duration(seconds: 1),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: const Border(
                      bottom:
                          BorderSide(width: 1.5, color: AppColors.pureWhite),
                    ),
                    borderRadius: BorderRadius.vertical(
                      top: widget.index == 0
                          ? const Radius.circular(12)
                          : const Radius.circular(0),
                      bottom: widget.index ==
                              widget.githubReposState.searchResults.length - 1
                          ? const Radius.circular(12)
                          : const Radius.circular(0),
                    ),
                  ),
                  // height: containerHeight,
                  child: widget.githubReposState.searchResults.isNotEmpty
                      ? Text(
                          widget.githubReposState.searchResults[widget.index]
                              .name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ).paddingOnly(top: 12, left: 16)
                      : const SizedBox(),
                ),
                suggestionAnimationState.isOpened
                    ? Text(widget.githubReposState.searchResults[widget.index]
                        .description)
                    : const SizedBox()
              ],
            ),
          ),
        ),
      );
    });
  }
}
