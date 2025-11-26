import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_prompt_app/core/constants/app_colors.dart';
import 'package:wedding_prompt_app/core/constants/app_icons.dart';
import 'package:wedding_prompt_app/core/constants/app_strings.dart';
import 'package:wedding_prompt_app/core/utils/text_styles.dart';
import 'package:wedding_prompt_app/features/promptscreen/bloc/prompt_bloc.dart';
import 'package:wedding_prompt_app/features/promptscreen/bloc/prompt_state.dart';
import 'package:wedding_prompt_app/routs/app_route_strings.dart';

import '../../core/constants/app_images.dart';
import '../favoritescreen/widget/custom_grid_item.dart';
import '../homescreen/models/categories_model.dart';
import 'bloc/prompt_event.dart';

class PromptScreen extends StatefulWidget {
  final CategoriesModel lovable;
  const PromptScreen({super.key, required this.lovable});

  @override
  State<PromptScreen> createState() => _PromptScreenState();
}

class _PromptScreenState extends State<PromptScreen> {
  List<CategoriesModel> relatedPrompts = [
    CategoriesModel(
      title: AppStrings.discoSangeet,
      image: AppImages.sangeetDanceF,
    ),
    CategoriesModel(
      title: AppStrings.thePalaceWedding,
      image: AppImages.onboarding1,
    ),
    CategoriesModel(
      title: AppStrings.gardenCouple,
      image: AppImages.gardenCouple,
    ),
    CategoriesModel(title: AppStrings.haldi, image: AppImages.haldiF),
  ];
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
      body: BlocBuilder<PromptBloc, PromptState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
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

                if (state.status == Status.initial)
                  ////let's create magic button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkYellow,
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: 100.w,
                      ),
                    ),
                    onPressed: () {
                      context.read<PromptBloc>().add(LoadData());
                    },
                    child: Text(
                      AppStrings.letsCreateMagic,
                      style: size18TextStyle(textColor: AppColors.black),
                    ),
                  )
                else if (state.status == Status.loading)
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: SizedBox(
                      height: 60.h,
                      width: 60.w,
                      child: DashedCircularProgressBar.aspectRatio(
                        animationCurve: Curves.linearToEaseOut,
                        aspectRatio: 1,
                        progress: state.progress!,
                        maxProgress: 100,
                        corners: StrokeCap.butt,
                        foregroundColor: AppColors.red,
                        backgroundColor: Color(0xffeeeeee),
                        foregroundStrokeWidth: 6,
                        backgroundStrokeWidth: 6,
                        animation: true,
                        child: Center(
                          child: Text(
                            '${state.progress?.toInt()}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                // CircularProgressIndicator(
                //   value: 1,
                //   color: AppColors.red,
                //   strokeWidth: 5,
                //   constraints: BoxConstraints(
                //     minHeight: 40.h,
                //     minWidth: 40.w,
                //   ),
                //   padding: EdgeInsets.all(70.h),
                // )
                else if (state.status == Status.success)
                ////prompt part
                ...[
                  Container(
                    width: 343.w,
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: AppColors.cream),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      child: Text(
                        textAlign: TextAlign.start,
                        "“Royal Indian pre-wedding photoshoot at ancient fort terrace during sunset, bride in pastel green lehenga with pink dupatta flowing in wind, groom in elegant olive sherwani, both holding hands, romantic eye contact, sandstone palace architecture, golden hour cinematic lighting, dramatic wide angle shot, sharp outfit embroidery details, natural hair movement, warm tones, professional wedding cinematography, 8K ultra-realistic, masterpiece composition”",
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ////open gemini button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkYellow,
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppIcons.gemini),
                        SizedBox(width: 5.w),
                        Text(
                          AppStrings.openInGeminiAI,
                          style: size18TextStyle(textColor: AppColors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  ////copy & share button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 11.h,
                            horizontal: 20.w,
                          ),
                          backgroundColor: AppColors.cream,
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Image.asset(AppIcons.copyP),
                            SizedBox(width: 6.w),
                            Text(
                              AppStrings.copyPrompt,
                              style: size16TextStyle(textColor: AppColors.red),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 11.h,
                            horizontal: 20.w,
                          ),
                          backgroundColor: AppColors.cream,
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Image.asset(AppIcons.shareP),
                            SizedBox(width: 6.w),
                            Text(
                              AppStrings.sharePrompt,
                              style: size16TextStyle(textColor: AppColors.red),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
                SizedBox(height: 20.h),
                Container(
                  height: state.status == Status.success ? 70.h : 241.h,
                  width: 375.w,
                  color: AppColors.black,
                  child: Center(
                    child: Text(
                      AppStrings.adBanner,
                      style: size18TextStyle(textColor: AppColors.white1),
                    ),
                  ),
                ),
                if (state.status != Status.loading) relatedPromptSection(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget relatedPromptSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 20),
          child: Text(AppStrings.relatedPrompts, style: size18TextStyle()),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: relatedPrompts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 315,
            crossAxisSpacing: 25,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return CustomGridItem(
              category: relatedPrompts[index],
              onTap: () {},
            );
          },
        ),
      ],
    );
  }
}
