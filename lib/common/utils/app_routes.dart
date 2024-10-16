import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiddie/src/entrypoint/views/entrypoint.dart';
import 'package:kiddie/src/onboarding/view/onboarding.dart';
import 'package:kiddie/src/splashscreen/view/spalshscreen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Splashscreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => Entrypoint(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnBoardingScreen(),
    ),
  ],
);

GoRouter get router => _router;
