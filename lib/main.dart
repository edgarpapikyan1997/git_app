import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:git_app/utils/app_colors.dart';
import 'view/screens/main_wrapper/main_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

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
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: AppColors.mainWhite),
        primaryColor: AppColors.primaryBlue,
        canvasColor: AppColors.mainWhite
      ),
      home: const MainWrapper(),
    );
  }
}