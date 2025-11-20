import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:wedding_prompt_app/core/constants/app_colors.dart';
import 'package:wedding_prompt_app/core/constants/app_strings.dart';
import 'package:wedding_prompt_app/features/bottomnavigationbar/bloc/bottom_navigation_bar_bloc.dart';
import 'package:wedding_prompt_app/features/bottomnavigationbar/bloc/bottom_navigation_bar_event.dart';
import 'package:wedding_prompt_app/features/bottomnavigationbar/bloc/bottom_navigation_bar_state.dart';
import 'package:wedding_prompt_app/features/favoritescreen/bloc/favorite_bloc.dart';
import 'package:wedding_prompt_app/features/favoritescreen/favorite_screen.dart';
import 'package:wedding_prompt_app/features/homescreen/bloc/homes_bloc.dart';
import 'package:wedding_prompt_app/features/homescreen/home_screen.dart';
import 'package:wedding_prompt_app/features/profilescreen/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screen = [
      BlocProvider(create: (context) => HomesBloc(), child: HomeScreen()),
      BlocProvider(
        create: (context) => FavoriteBloc(),
        child: FavoriteScreen(),
      ),
      ProfileScreen(),
    ];
    return BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) =>
                FadeTransition(opacity: animation, child: child),
            child: KeyedSubtree(
              key: ValueKey(state.currentNavBarIndex),
              child: screen[state.currentNavBarIndex],
            ),
          ),
          // IndexedStack(index: state.currentNavBarIndex, children: screen),
          bottomNavigationBar: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.r, vertical: 16.r),
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: MotionTabBar(
              controller: _motionTabBarController,
              initialSelectedTab: AppStrings.navBarhome,
              labels: [
                AppStrings.navBarhome,
                AppStrings.navBarFavorite,
                AppStrings.navBarProfile,
              ],
              icons: [
                Icons.home_filled,
                CupertinoIcons.heart_solid,
                Icons.person_rounded,
              ],
              tabSize: 50.h,
              tabBarHeight: 60.h,
              tabIconSize: 27.h,
              tabIconSelectedSize: 31.h,
              tabSelectedColor: AppColors.red,
              tabIconSelectedColor: Colors.white,
              tabIconColor: Colors.white,
              tabBarColor: Colors.transparent,
              textStyle: TextStyle(fontSize: 13, color: Colors.white),
              onTabItemSelected: (int value) {
                _motionTabBarController!.index = value;
                context.read<BottomNavigationBarBloc>().add(NavBarIndex(value));
              },
            ),
          ),
        );
      },
    );
  }
}
