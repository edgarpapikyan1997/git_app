import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/extensions/extensions.dart';
import '../../utils/assets.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  Color filledColor = AppColors.layerColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
      decoration: InputDecoration(
        prefixIcon: Assets.search.svg().paddingOnly(left: 16, right: 10),
        suffixIcon: filledColor == AppColors.secondaryBlue
            ? Assets.close.svg().paddingOnly(right: 16)
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
