import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_prompt_app/features/onboarding/on_boarding_screen.dart';
import 'package:wedding_prompt_app/features/splash/splash_screen.dart';
import 'package:wedding_prompt_app/routs/app_route_strings.dart';

final GlobalKey<NavigatorState> navigatoryKey = GlobalKey<NavigatorState>();

class Routes {
  final goRouter = GoRouter(
    initialLocation: AppRouteStrings.splash,
    navigatorKey: navigatoryKey,
    routes: [
      GoRoute(
        path: AppRouteStrings.splash,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: AppRouteStrings.onboarding,
        builder: (context, state) => OnBoardingScreen(),
      ),
    ],
  );
}
