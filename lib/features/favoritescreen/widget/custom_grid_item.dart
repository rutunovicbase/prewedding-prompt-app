import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_icons.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/utils/text_styles.dart';
import '../../homescreen/models/categories_model.dart';
// port '../../homescreen/models/categories_model.dart';

///// custom  gird class in Fav screen
class CustomGridItem extends StatelessWidget {
  final CategoriesModel category;
  final VoidCallback onTap;

  const CustomGridItem({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            InkWell(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.white1,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.darkYellow, width: 1.w),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black,
                      blurRadius: 15.r,
                      spreadRadius: -8.r,
                      offset: const Offset(5, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(
                        category.image,
                        height: 230.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Center(
                      child: Text(
                        category.title,
                        style: size16TextStyle(
                          fontFamily: AppStrings.playfairDisplay,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 15,
              top: 15,
              child: Image.asset(AppIcons.heart, height: 30.h),
            ),
          ],
        ),
      ],
    );
  }
}
