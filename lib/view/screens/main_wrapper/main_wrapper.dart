import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../repositories/dio_client/dio_client.dart';
import '../../../utils/assets.dart';
import '../../../utils/extensions/extensions.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/custom_app_bar/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/search_widget.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(62), // here the desired height
        child: CustomAppBar(
          title: 'search.fitReposList'.tr(),
          teal: CustomButton(
            child: Assets.favActive.svg(),
          ).paddingOnly(right: 16),
        ),
      ),
      backgroundColor: AppColors.layerColor,
      body: Container(
        height: context.height,
        width: context.width,
        color: AppColors.mainWhite,
        child: Column(
          children: [
            SearchWidget(),

           Center(
             child: FloatingActionButton(
               onPressed: () {
                 DioClient().getRepositoriesWithSearch(query: 'edpap7788@gmail.com',);
               },
               backgroundColor: Colors.red,
             ),
           )
          ],
        ),
      ).paddingOnly(top: 5),
    );
  }
}
