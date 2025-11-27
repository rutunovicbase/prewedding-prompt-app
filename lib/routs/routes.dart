// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:wedding_prompt_app/features/bottomnavigationbar/bloc/bottom_navigation_bar_bloc.dart';
// import 'package:wedding_prompt_app/features/homescreen/bloc/homes_bloc.dart';
// import 'package:wedding_prompt_app/features/homescreen/home_screen.dart';
// import 'package:wedding_prompt_app/features/onboarding/on_boarding_screen.dart';
// import 'package:wedding_prompt_app/features/splash/splash_screen.dart';
// import 'package:wedding_prompt_app/routs/app_route_strings.dart';
//
// import '../features/bottomnavigationbar/bottom_nav_bar.dart';
// import '../features/onboarding/bloc/onboarding_cubit.dart';
//
// final GlobalKey<NavigatorState> navigatoryKey = GlobalKey<NavigatorState>();
//
// class Routes {
//   static final GoRouter router = GoRouter(
//     initialLocation: AppRouteStrings.splash,
//     navigatorKey: navigatoryKey,
//     routes: [
//       GoRoute(
//         path: AppRouteStrings.splash,
//         builder: (context, state) => SplashScreen(),
//       ),
//       GoRoute(
//         path: AppRouteStrings.onboarding,
//         builder: (context, state) {
//           return BlocProvider(
//             create: (_) => OnboardingCubit(),
//             child: const OnBoardingScreen(),
//           );
//         },
//       ),
//       GoRoute(
//         path: AppRouteStrings.homeScreen,
//         builder: (context, state) {
//           return BlocProvider(
//             create: (_) => HomesBloc(),
//             child: const HomeScreen(),
//           );
//         },
//       ),
//       GoRoute(
//         path: AppRouteStrings.bottomNavBar,
//         builder: (context, state) {
//           return BlocProvider(
//             create: (_) => BottomNavigationBarBloc(),
//             child: const BottomNavBar(),
//           );
//         },
//       ),
//     ],
//   );
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_prompt_app/features/bottomnavigationbar/bloc/bottom_navigation_bar_bloc.dart';
import 'package:wedding_prompt_app/features/categories/categories_screen.dart';
import 'package:wedding_prompt_app/features/homescreen/bloc/homes_bloc.dart';
import 'package:wedding_prompt_app/features/homescreen/home_screen.dart';
import 'package:wedding_prompt_app/features/homescreen/models/categories_model.dart';
import 'package:wedding_prompt_app/features/howtousescreen/how_to_use_screen.dart';
import 'package:wedding_prompt_app/features/promptscreen/bloc/prompt_bloc.dart';
import 'package:wedding_prompt_app/features/promptscreen/prompt_screen.dart';
import 'package:wedding_prompt_app/features/splash/splash_screen.dart';
import 'package:wedding_prompt_app/routs/app_route_strings.dart';

import '../features/bottomnavigationbar/bottom_nav_bar.dart';
import '../features/onboarding/bloc/onboarding_cubit.dart';
import '../features/onboarding/on_boarding_screen.dart';

final GlobalKey<NavigatorState> navigatoryKey = GlobalKey<NavigatorState>();

class Routes {
  static final GoRouter router = GoRouter(
    initialLocation: AppRouteStrings.splash,
    navigatorKey: navigatoryKey,
    routes: [
      /////////////    SPLASH
      GoRoute(
        path: AppRouteStrings.splash,
        pageBuilder: (context, state) =>
            fadePage(state: state, child: SplashScreen()),
      ),

      /////////////    ONBOARDING
      GoRoute(
        path: AppRouteStrings.onboarding,
        pageBuilder: (context, state) => fadePage(
          state: state,
          child: BlocProvider(
            create: (_) => OnboardingCubit(),
            child: const OnBoardingScreen(),
          ),
        ),
      ),

      /////////////////////    HOME
      GoRoute(
        path: AppRouteStrings.homeScreen,
        pageBuilder: (context, state) => fadePage(
          state: state,
          child: BlocProvider(
            create: (_) => HomesBloc(),
            child: const HomeScreen(),
          ),
        ),
      ),

      ///////////////    BOTTOM NAV BAR
      GoRoute(
        path: AppRouteStrings.bottomNavBar,
        pageBuilder: (context, state) => fadePage(
          state: state,
          child: BlocProvider(
            create: (_) => BottomNavigationBarBloc(),
            child: const BottomNavBar(),
          ),
        ),
      ),
      // Categories Screen
      GoRoute(
        path: AppRouteStrings.categoriesScreen,
        builder: (context, state) {
          final data = state.extra as CategoriesModel;
          return CategoriesScreen(category: data);
        },
      ),
      ////  promptScreen
      GoRoute(
        path: AppRouteStrings.promptScreen,
        builder: (context, state) {
          final data = state.extra as CategoriesModel;
          return BlocProvider(
            create: (context) => PromptBloc(),
            child: PromptScreen(lovable: data),
          );
        },
      ),
      ////  How to use screen
      GoRoute(
        path: AppRouteStrings.howToUseScreen,
        builder: (context, state) {
          return HowToUseScreen();
        },
      ),
    ],
  );
}

///////    FADE TRANSITION FUNCTION
CustomTransitionPage fadePage({
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 3000),
    // reverseTransitionDuration: const Duration(milliseconds: 800),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        child: child,
      );
    },
  );
}
