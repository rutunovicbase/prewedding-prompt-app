import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_prompt_app/core/constants/app_colors.dart';
import 'package:wedding_prompt_app/core/constants/app_strings.dart';
import 'package:wedding_prompt_app/core/utils/text_styles.dart';
import 'package:wedding_prompt_app/features/favoritescreen/widget/custom_grid_item.dart';
import 'package:wedding_prompt_app/routs/app_route_strings.dart';

import '../../core/constants/app_images.dart';
import '../homescreen/models/categories_model.dart';
import 'bloc/favorite_bloc.dart';
import 'bloc/favorite_event.dart';
import 'bloc/favorite_state.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<CategoriesModel> gridViewItems = [
    CategoriesModel(
      title: AppStrings.thePalaceWedding,
      image: AppImages.onboarding1,
    ),
    CategoriesModel(
      title: AppStrings.gardenCouple,
      image: AppImages.gardenCouple,
    ),
    CategoriesModel(
      title: AppStrings.discoSangeet,
      image: AppImages.sangeetDanceF,
    ),
    CategoriesModel(title: AppStrings.haldi, image: AppImages.haldiF),
  ];
  List<String> topCategoriesList = [
    AppStrings.all,
    AppStrings.preWedding,
    AppStrings.sangeet,
    AppStrings.haldi,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppStrings.navBarFavorite,
              style: size22TextStyle(textColor: AppColors.red),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.categories,
                        style: size18TextStyle(textColor: AppColors.black),
                      ),
                      SizedBox(height: 12.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(topCategoriesList.length, (
                            index,
                          ) {
                            final bool isSelected =
                                state.selectedIndex == index;

                            return GestureDetector(
                              onTap: () => context.read<FavoriteBloc>().add(
                                SelectedIndex(index),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 18.w,
                                  vertical: 8.h,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.cream
                                      : AppColors.white2,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: AppColors.cream,
                                    width: isSelected ? 0 : 0.8,
                                  ),
                                ),
                                child: Text(
                                  topCategoriesList[index],
                                  style: size14TextStyle(
                                    textColor: AppColors.black,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 13),
                GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: gridViewItems.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 315,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 20,
                    childAspectRatio: .50,
                  ),
                  itemBuilder: (context, index) {
                    return CustomGridItem(
                      category: gridViewItems[index],
                      onTap: () => context.push(
                        AppRouteStrings.promptScreen,
                        extra: gridViewItems[index],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
