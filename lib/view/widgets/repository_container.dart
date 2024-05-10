import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:git_app/utils/extensions/extensions.dart';

import '../../utils/app_colors.dart';
import '../../utils/assets.dart';

class RepositoryContainer extends StatefulWidget {
  final String repoName;
  final bool isFavorite;

  const RepositoryContainer(
      {super.key, required this.repoName, required this.isFavorite});

  @override
  State<RepositoryContainer> createState() => _RepositoryContainerState();
}

class _RepositoryContainerState extends State<RepositoryContainer> {

  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
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
          Text(widget.repoName.isEmpty ? "Undefined" : widget.repoName),
          GestureDetector(
            onTap: () {

              ///Change to mobx
              setState(() {
                isFavorite = !isFavorite;
                print(widget.isFavorite);
              });
            },
            child: SizedBox(
              height: 44,
              width: 44,
              child: Assets.favActive.svg(
                  color: widget.isFavorite
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
