import 'package:flutter/cupertino.dart';
import 'package:git_app/view/screens/main_wrapper/main_wrapper.dart';
import 'package:go_router/go_router.dart';
import '../../view/screens/favorites_screen/favorites_screen.dart';


final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MainWrapper();
      },
      routes: [
        GoRoute(
          path: 'favorites_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const FavoritesScreen();
          },
        ),
      ],
    ),
  ],
);