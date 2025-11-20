import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_prompt_app/core/constants/app_icons.dart';
import 'package:wedding_prompt_app/core/constants/app_images.dart';
import 'package:wedding_prompt_app/features/homescreen/bloc/homes_bloc.dart';
import 'package:wedding_prompt_app/features/homescreen/bloc/homes_event.dart';
import 'package:wedding_prompt_app/features/homescreen/bloc/homes_state.dart';
import 'package:wedding_prompt_app/routs/app_route_strings.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/utils/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomesBloc>().add(SliderTimer());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomesBloc>();

    // Demo category list

    List<Map<String, String>> categories = [
      {"title": AppStrings.preWedding, "image": AppImages.preWedding},
      {"title": AppStrings.engagement, "image": AppImages.engagement},
      {"title": AppStrings.wedding, "image": AppImages.wedding},
      {"title": AppStrings.sangeet, "image": AppImages.sangeet},
      {"title": AppStrings.haldi, "image": AppImages.haldi},
      {"title": AppStrings.mehndi, "image": AppImages.mehndi},
      {"title": AppStrings.grahpravesh, "image": AppImages.grahpravesh},
    ];

    return Scaffold(
      // bottomNavigationBar: Expanded(
      //   child: Container(
      //     margin: const EdgeInsets.symmetric(horizontal: 18),
      //     height: 90.h,
      //     width: double.infinity.w,
      //     decoration: BoxDecoration(
      //       color: AppColors.black,
      //       borderRadius: BorderRadius.circular(16),
      //     ),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // ---------------- HOME ----------------
      //         GestureDetector(
      //           onTap: () {
      //             context.read<HomesBloc>().add(NavBarInex(0));
      //           },
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               bloc.state.navbarIndex == 0
      //                   ? Image.asset(
      //                       AppIcons.navbarHomeFill,
      //                       height: 50.h,
      //                       width: 50.w,
      //                     ) // Selected Icon
      //                   : Image.asset(
      //                       AppIcons.navbarHome,
      //                       height: 26.h,
      //                       width: 26.w,
      //                     ), // Unselected Icon
      //
      //               const SizedBox(height: 5),
      //
      //               Text(
      //                 AppStrings.navBarhome,
      //                 style: size14TextStyle(
      //                   textColor: bloc.state.navbarIndex == 0
      //                       ? AppColors.white1
      //                       : AppColors.transparent,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //
      //         // ---------------- FAVORITE ----------------
      //         GestureDetector(
      //           onTap: () {
      //             context.read<HomesBloc>().add(NavBarInex(1));
      //           },
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               bloc.state.navbarIndex == 1
      //                   ? Image.asset(
      //                       AppIcons.navbarHeartFill,
      //                       height: 50.h,
      //                       width: 50.w,
      //                     ) // Selected
      //                   : Image.asset(
      //                       AppIcons.navbarHeart,
      //                       height: 26.h,
      //                       width: 26.w,
      //                     ), // Unselected
      //
      //               const SizedBox(height: 5),
      //
      //               Text(
      //                 AppStrings.navBarFavorite,
      //                 style: size14TextStyle(
      //                   textColor: bloc.state.navbarIndex == 1
      //                       ? AppColors.white1
      //                       : AppColors.transparent,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //
      //         // ---------------- PROFILE ----------------
      //         GestureDetector(
      //           onTap: () {
      //             context.read<HomesBloc>().add(NavBarInex(2));
      //           },
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               bloc.state.navbarIndex == 2
      //                   ? Image.asset(
      //                       AppIcons.navbarProfileFill,
      //                       height: 50.h,
      //                       width: 50.w,
      //                     ) // Selected
      //                   : Image.asset(
      //                       AppIcons.navbarProfile,
      //                       height: 26.h,
      //                       width: 26.w,
      //                     ), // Unselected
      //
      //               const SizedBox(height: 5),
      //
      //               Text(
      //                 AppStrings.navBarProfile,
      //                 style: size14TextStyle(
      //                   textColor: bloc.state.navbarIndex == 2
      //                       ? AppColors.white1
      //                       : AppColors.transparent,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        title: Text(
          AppStrings.aiWedMaker,
          style: size20TextStyle(textColor: AppColors.darkRed),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),

            ////////////     SLIDER
            BlocBuilder<HomesBloc, HomesState>(
              builder: (context, state) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 2500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },

                  child: Stack(
                    key: ValueKey<int>(state.currentIndex), // IMPORTANT
                    children: [
                      SizedBox(
                        height: 280,
                        child: Image.asset(
                          bloc.sliderImage[state.currentIndex]["Image"]!,
                          fit: BoxFit.cover,
                        ),
                      ),

                      //  Icon
                      Positioned(
                        top: 15.h,
                        right: 15.h,
                        child: Image.asset(AppIcons.heart, fit: BoxFit.cover),
                      ),

                      // Title and Generate Button
                      Positioned(
                        bottom: 15,
                        right: 0,
                        left: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              height: 25,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.red,
                                    AppColors.darkYellow.withValues(alpha: .1),
                                    AppColors.transparent,
                                  ],
                                  stops: [0.2, 0.7, 1.0],
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  bloc.sliderImage[state
                                      .currentIndex]["title"]!,
                                  style: size12TextStyle(
                                    fontFamily: AppStrings.playfair,
                                    fontWeight: FontWeight.w300,
                                    textColor: AppColors.white,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.darkYellow,
                                ),
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 3,
                                  ),
                                  child: Text(
                                    AppStrings.generate,
                                    style: size14TextStyle(
                                      textColor: AppColors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            ////////////    LOVABLE CATEGORIES TITLE
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  textAlign: TextAlign.left,
                  AppStrings.lovableCategories,
                  style: size18TextStyle(),
                ),
              ),
            ),

            ///////////     FIRST 2 CATEGORY ITEMS
            _buildCommonGridView(
              itemCount: 2,
              itemBuilder: (context, index) {
                return categoryItem(
                  image: categories[index]["image"]!,
                  title: categories[index]["title"]!,
                );
              },
            ),

            SizedBox(height: 20.h),

            ///////////    FULL WIDTH THIRD ITEM
            fullWidthCategoryItem(
              image: categories[2]["image"]!,
              title: categories[2]["title"]!,
            ),
            SizedBox(height: 20.h),
            Container(
              color: AppColors.black,
              height: 70.h,
              width: 375.h,
              child: Center(
                child: Text(
                  AppStrings.adBanner,
                  style: size18TextStyle(textColor: AppColors.white1),
                ),
              ),
            ),
            SizedBox(height: 20.h),

            /////////     REMAINING ITEMS GRID
            _buildCommonGridView(
              itemCount: categories.length - 3,
              itemBuilder: (context, index) {
                return categoryItem(
                  image: categories[index + 3]["image"]!,
                  title: categories[index + 3]["title"]!,
                );
              },
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCommonGridView({
    required int itemCount,
    required Widget? Function(BuildContext, int) itemBuilder,
  }) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      physics: NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.w,
        mainAxisSpacing: 20.h,
        childAspectRatio: .83,
      ),
      itemBuilder: itemBuilder,
    );
  }

  /////////////    CATEGORY ITEM Normal Grid    //////////
  Widget categoryItem({required String image, required String title}) {
    return InkWell(
      onTap: () => context.push(AppRouteStrings.categories),
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: AppColors.white1,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.darkYellow, width: 1),
          boxShadow: [
            BoxShadow(
              color: AppColors.black,
              blurRadius: 15,
              spreadRadius: -8,
              offset: Offset(5, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: size16TextStyle(
                    fontFamily: AppStrings.playfairDisplay,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //////////      FULL WIDTH CATEGORY ITEM
  Widget fullWidthCategoryItem({required String image, required String title}) {
    return InkWell(
      onTap: () {
        context.push(AppRouteStrings.categories);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: AppColors.white1,
          borderRadius: BorderRadius.circular(40.r),
          border: Border.all(color: AppColors.darkYellow, width: 1),
          boxShadow: [
            BoxShadow(
              color: AppColors.black,
              blurRadius: 15,
              spreadRadius: -8,
              offset: Offset(5, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30.r),
              child: Image.asset(image, fit: BoxFit.fill),
            ),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 10.h),
              child: Text(
                title,
                style: size16TextStyle(
                  fontFamily: AppStrings.playfairDisplay,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
