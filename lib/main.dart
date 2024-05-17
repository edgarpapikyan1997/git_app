import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:git_app/utils/app_colors.dart';
import 'package:git_app/utils/go_router/go_router.dart';
import 'package:git_app/utils/service_locator/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setupDependencies();
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        child: const App()),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: AppColors.mainWhite),
        primaryColor: AppColors.primaryBlue,
        canvasColor: AppColors.mainWhite
      ),
    );
  }
}
