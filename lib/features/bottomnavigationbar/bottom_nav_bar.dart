import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding_prompt_app/features/bottomnavigationbar/bloc/bottom_navigation_bar_bloc.dart';
import 'package:wedding_prompt_app/features/bottomnavigationbar/bloc/bottom_navigation_bar_event.dart';
import 'package:wedding_prompt_app/features/favoritescreen/favorite_screen.dart';
import 'package:wedding_prompt_app/features/homescreen/home_screen.dart';
import 'package:wedding_prompt_app/features/profilescreen/profile_screen.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import '../../core/constants/app_strings.dart';
import '../../core/utils/text_styles.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> screen = [
      HomeScreen(),
      FavoriteScreen(),
      ProfileScreen(),
    ];
    final bloc = context.read<BottomNavigationBarBloc>();
    return Scaffold(
      body: screen[bloc.state.currentNavBarIndex],
      bottomNavigationBar: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            height: 90.h,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // ---------------- HOME ----------------
                GestureDetector(
                  onTap: () {
                    context.read<BottomNavigationBarBloc>().add(NavBarIndex(0));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      bloc.state.currentNavBarIndex == 0
                          ? Image.asset(AppIcons.navbarHomeFill, height: 50.h)
                          : Image.asset(AppIcons.navbarHome, height: 26.h),
                      const SizedBox(height: 5),
                      Text(
                        AppStrings.navBarhome,
                        style: size14TextStyle(
                          textColor: bloc.state.currentNavBarIndex == 0
                              ? AppColors.white1
                              : AppColors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),

                // ---------------- FAVORITE ----------------
                GestureDetector(
                  onTap: () {
                    context.read<BottomNavigationBarBloc>().add(NavBarIndex(1));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      bloc.state.currentNavBarIndex == 1
                          ? Image.asset(AppIcons.navbarHeartFill, height: 50.h)
                          : Image.asset(AppIcons.navbarHeart, height: 26.h),
                      const SizedBox(height: 5),
                      Text(
                        AppStrings.navBarFavorite,
                        style: size14TextStyle(
                          textColor: bloc.state.currentNavBarIndex == 1
                              ? AppColors.white1
                              : AppColors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),

                // ---------------- PROFILE ----------------
                GestureDetector(
                  onTap: () {
                    context.read<BottomNavigationBarBloc>().add(NavBarIndex(2));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      bloc.state.currentNavBarIndex == 2
                          ? Image.asset(
                              AppIcons.navbarProfileFill,
                              height: 50.h,
                            )
                          : Image.asset(AppIcons.navbarProfile, height: 26.h),
                      const SizedBox(height: 5),
                      Text(
                        AppStrings.navBarProfile,
                        style: size14TextStyle(
                          textColor: bloc.state.currentNavBarIndex == 2
                              ? AppColors.white1
                              : AppColors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
