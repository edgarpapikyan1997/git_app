import 'package:flutter/material.dart';
import '../../http/repositories/github_ropository.dart';
import '../../model/repo_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/extensions/extensions.dart';
import '../../utils/assets.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController searchController = TextEditingController();
  final GitHubRepositories gitHubApiService = GitHubRepositories();
  List<RepositoryModel> searchResults = [];

  void _searchRepositories(String query) async {
    var results = await gitHubApiService.searchRepositories(query);
    setState(() {
      searchResults = results;
    });
    print(searchResults[0].name);
  }

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
      onTap: () {
        setState(() {
          filledColor = AppColors.secondaryBlue;
        });
      },
      onSubmitted: (controllerText) {
        print('submitted');
        if (controllerText.isEmpty) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('search.noDataTyped'.tr()),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      ///Need to be changed to Go Router
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        } else {
          _searchRepositories(controllerText);
        }
      },
      decoration: InputDecoration(
        prefixIcon: Assets.search.svg().paddingOnly(left: 16, right: 10),
        suffixIcon: filledColor == AppColors.secondaryBlue
            ? GestureDetector(
          child: Assets.close.svg().paddingOnly(right: 16),
          onTap: () {
            searchController.clear();
          },
        )
            : const SizedBox(),
        filled: true,
        fillColor: filledColor,
        focusColor: AppColors.primaryBlue,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(width: 3, color: AppColors.primaryBlue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(width: 3, color: AppColors.mainWhite),
        ),
      ),
    ).paddingOnly(top: 24, bottom: 16, left: 16, right: 16);
  }
}
