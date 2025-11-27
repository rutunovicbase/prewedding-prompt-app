import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_prompt_app/core/constants/app_colors.dart';
import 'package:wedding_prompt_app/core/constants/app_icons.dart';
import 'package:wedding_prompt_app/core/constants/app_strings.dart';
import 'package:wedding_prompt_app/core/utils/text_styles.dart';
import 'package:wedding_prompt_app/features/howtousescreen/widget/common_info_widget.dart';
import 'package:wedding_prompt_app/routs/app_route_strings.dart';

class HowToUseScreen extends StatefulWidget {
  const HowToUseScreen({super.key});

  @override
  State<HowToUseScreen> createState() => _HowToUseScreenState();
}

class _HowToUseScreenState extends State<HowToUseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop(AppRouteStrings.promptScreen);
          },
          icon: Icon(CupertinoIcons.chevron_left_circle, size: 30.h),
        ),

        title: Text(
          AppStrings.howToUse,
          style: size22TextStyle(fontFamily: AppStrings.playfairDisplay),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
              height: 200.h,
              width: 343.w,
              decoration: BoxDecoration(
                color: AppColors.cream,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Center(
                child: Text(
                  AppStrings.video,
                  style: size22TextStyle(
                    fontFamily: AppStrings.playfairDisplay,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            CommonInfoWidget(
              title: AppStrings.generateCopy,
              description: AppStrings.descriptionHtu1,
              icon: AppIcons.generateCopy,
            ),
            CommonInfoWidget(
              title: AppStrings.openInGemini,
              description: AppStrings.descriptionHtu2,
              icon: AppIcons.openInGemini,
            ),
            CommonInfoWidget(
              title: AppStrings.useInAITools,
              description: AppStrings.descriptionHtu3,
              icon: AppIcons.useInAITools,
            ),
            CommonInfoWidget(
              title: AppStrings.saveFavorites,
              description: AppStrings.descriptionHtu4,
              icon: AppIcons.saveFavorites,
            ),
          ],
        ),
      ),
    );
  }
}
