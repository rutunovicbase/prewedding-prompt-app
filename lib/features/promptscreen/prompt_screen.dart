import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_prompt_app/core/constants/app_colors.dart';
import 'package:wedding_prompt_app/core/constants/app_icons.dart';
import 'package:wedding_prompt_app/core/constants/app_strings.dart';
import 'package:wedding_prompt_app/core/utils/text_styles.dart';
import 'package:wedding_prompt_app/routs/app_route_strings.dart';

import '../homescreen/models/categories_model.dart';

class PromptScreen extends StatefulWidget {
  final CategoriesModel lovable;
  const PromptScreen({super.key, required this.lovable});

  @override
  State<PromptScreen> createState() => _PromptScreenState();
}

class _PromptScreenState extends State<PromptScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: context.pop,
          icon: Icon(CupertinoIcons.chevron_left_circle, size: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push(AppRouteStrings.howToUseScreen);
            },
            icon: Icon(CupertinoIcons.question_circle, size: 30),
          ),
        ],

        title: Text(
          widget.lovable.title,
          style: size20TextStyle(
            fontFamily: AppStrings.playfairDisplay,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 8.h),
          Stack(
            children: [
              Image.asset(widget.lovable.image),
              Positioned(
                top: 15.h,
                right: 15.w,
                child: Image.asset(AppIcons.heart),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.darkYellow,
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 100.w),
            ),
            onPressed: () {},
            child: Text(
              AppStrings.letsCreateMagic,
              style: size18TextStyle(textColor: AppColors.black),
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            height: 241.h,
            width: 375.w,
            color: AppColors.black,
            child: Center(
              child: Text(
                AppStrings.adBanner,
                style: size18TextStyle(textColor: AppColors.white1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
