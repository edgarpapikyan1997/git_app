import 'package:flutter/material.dart';
import 'package:git_app/presenter/mobx/github_repositories_state/github_repos_state.dart';
import 'package:git_app/utils/extensions/context_extension.dart';
import 'package:git_app/utils/extensions/widget_extension.dart';
import '../../../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String? title;
  final Widget? teal;

  const CustomAppBar(
      {super.key, this.title, this.teal, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading ?? const SizedBox(),
      title: Text(
        title ?? '',
        style: context.theme.headline6.medium,
      ),
      centerTitle: true,
      actions: [teal ?? const SizedBox().paddingOnly(right: 15)],
    );

    Container(
      color: AppColors.mainWhite,
      child: Column(
        children: [
          const SizedBox(
            height: 62,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              leading ?? const SizedBox(),
              Spacer(),
              Text(title ?? ''),
              Spacer(),
              teal ?? const SizedBox(),
            ],
          ).paddingOnly(left: 15, right: 15),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
