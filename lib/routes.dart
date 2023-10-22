import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_flutter/src/features/home/presentation/screen/HomeScreen.dart';
import 'package:hello_flutter/src/features/user/ui/presentation/details/UserDetailsScreen.dart';
import 'package:hello_flutter/src/features/user/ui/presentation/users/UsersScreen.dart';

final routes = GoRouter(
  //initialLocation: '/users',
  //refreshListenable: getIt<AuthService>(),
  //redirect: (state) {
  // final isAuthenticated = getIt<AuthService>().isAuthenticated;
  // final isLoginRoute = state.subloc == '/login';

  // if (!isAuthenticated) {
  //   return isLoginRoute ? null : '/login';
  // }

  // if (isLoginRoute) return '/users';

  //  return null;
  //},
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(title: "Home"),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const HomeScreen(title: "Home"),
    ),
    GoRoute(
      path: '/users',
      builder: (context, state) => const UsersScreen(),
    ),
    GoRoute(
      path: '/users/add',
      pageBuilder: (context, state) => const MaterialPage(
        child: Placeholder(),
        fullscreenDialog: true,
      ),
    ),
    GoRoute(
      path: '/users/:userId',
      //builder: (context, state) => const HomeScreen(title: "Home"),

      builder: (context, state) {
        return UserDetailsScreen(id: state.pathParameters['userId']!);
      },
    ),
  ],
);
