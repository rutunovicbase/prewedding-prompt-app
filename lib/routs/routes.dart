import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_prompt_app/features/bottomnavigationbar/bloc/bottom_navigation_bar_bloc.dart';
import 'package:wedding_prompt_app/features/homescreen/bloc/homes_bloc.dart';
import 'package:wedding_prompt_app/features/homescreen/home_screen.dart';
import 'package:wedding_prompt_app/features/onboarding/on_boarding_screen.dart';
import 'package:wedding_prompt_app/features/splash/splash_screen.dart';
import 'package:wedding_prompt_app/routs/app_route_strings.dart';

import '../features/bottomnavigationbar/bottom_nav_bar.dart';
import '../features/onboarding/bloc/onboarding_cubit.dart';

final GlobalKey<NavigatorState> navigatoryKey = GlobalKey<NavigatorState>();

class Routes {
  static final GoRouter router = GoRouter(
    initialLocation: AppRouteStrings.splash,
    navigatorKey: navigatoryKey,
    routes: [
      GoRoute(
        path: AppRouteStrings.splash,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: AppRouteStrings.onboarding,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => OnboardingCubit(),
            child: const OnBoardingScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRouteStrings.homeScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => HomesBloc(),
            child: const HomeScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRouteStrings.bottomNavBar,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => BottomNavigationBarBloc(),
            child: const BottomNavBar(),
          );
        },
      ),
    ],
  );
}
