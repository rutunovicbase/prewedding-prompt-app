import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_prompt_app/core/constants/app_strings.dart';
import 'package:wedding_prompt_app/core/utils/text_styles.dart';
import 'package:wedding_prompt_app/features/homescreen/models/categories_model.dart';
import 'package:wedding_prompt_app/routs/app_route_strings.dart';

import '../../core/constants/app_images.dart';
import '../favoritescreen/widget/custom_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  final CategoriesModel category;

  const CategoriesScreen({super.key, required this.category});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(CupertinoIcons.chevron_left_circle, size: 25.h),
        ),
        title: Text(
          widget.category.title,
          style: size22TextStyle(fontFamily: AppStrings.playfairDisplay),
        ),
      ),
      body: GridView.builder(
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
            onTap: () {
              context.push(
                AppRouteStrings.promptScreen,
                extra: gridViewItems[index],
              );
            },
          );
        },
      ),
    );
  }
}
