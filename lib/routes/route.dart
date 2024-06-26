import 'package:car_platform/Pages/Garage_Page.dart';
import 'package:car_platform/Pages/Home_Page.dart';
import 'package:car_platform/Pages/Main_Page.dart';
import 'package:car_platform/Pages/Profile_Page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorGarageKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellGarage');
final _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

Widget myTransition(child, animation) {
  return FadeTransition(
      opacity: CurveTween(curve: Curves.easeIn).animate(animation),
      child: child);
}

final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
          builder: (BuildContext context, GoRouterState state,
              StatefulNavigationShell navigationShell) {
            return MainPage(navigationShell: navigationShell);
          },
          branches: <StatefulShellBranch>[
            StatefulShellBranch(navigatorKey: _shellNavigatorHomeKey, routes: [
              GoRoute(
                path: '/home',
                name: 'home',
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    name: state.name,
                    child: HomePage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return myTransition(child, animation);
                    },
                  );
                },
              )
            ]),
            StatefulShellBranch(
                navigatorKey: _shellNavigatorGarageKey,
                routes: [
                  GoRoute(
                    path: '/garage',
                    name: 'garage',
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        name: state.name,
                        child: GaragePage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return myTransition(child, animation);
                        },
                      );
                    },
                  )
                ]),
            StatefulShellBranch(
                navigatorKey: _shellNavigatorProfileKey,
                routes: [
                  GoRoute(
                    path: '/profile',
                    name: 'profile',
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        name: state.name,
                        child: ProfilePage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return myTransition(child, animation);
                        },
                      );
                    },
                  )
                ]),
          ])
    ]);
