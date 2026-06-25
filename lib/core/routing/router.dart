import 'package:expert/core/routing/app_routes.dart';
import 'package:expert/features/authentication/presentation/pages/login_screen.dart';
import 'package:expert/features/authentication/presentation/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
      },),
     GoRoute(
      path: AppRoutes.loginScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },),

  ],
);
