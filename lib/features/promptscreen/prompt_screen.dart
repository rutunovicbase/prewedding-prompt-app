// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:wedding_prompt_app/core/constants/app_colors.dart';
// import 'package:wedding_prompt_app/core/constants/app_icons.dart';
// import 'package:wedding_prompt_app/core/constants/app_strings.dart';
// import 'package:wedding_prompt_app/core/utils/text_styles.dart';
// import 'package:wedding_prompt_app/features/promptscreen/bloc/prompt_bloc.dart';
// import 'package:wedding_prompt_app/features/promptscreen/bloc/prompt_state.dart';
// import 'package:wedding_prompt_app/routs/app_route_strings.dart';
//
// import '../../core/constants/app_images.dart';
// import '../favoritescreen/widget/custom_grid_item.dart';
// import '../homescreen/models/categories_model.dart';
// import 'bloc/prompt_event.dart';
//
// class PromptScreen extends StatefulWidget {
//   final CategoriesModel lovable;
//   const PromptScreen({super.key, required this.lovable});
//
//   @override
//   State<PromptScreen> createState() => _PromptScreenState();
// }
//
// class _PromptScreenState extends State<PromptScreen> {
//   List<CategoriesModel> relatedPrompts = [
//     CategoriesModel(
//       title: AppStrings.discoSangeet,
//       image: AppImages.sangeetDanceF,
//     ),
//     CategoriesModel(
//       title: AppStrings.thePalaceWedding,
//       image: AppImages.onboarding1,
//     ),
//     CategoriesModel(
//       title: AppStrings.gardenCouple,
//       image: AppImages.gardenCouple,
//     ),
//     CategoriesModel(title: AppStrings.haldi, image: AppImages.haldiF),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: context.pop,
//           icon: Icon(CupertinoIcons.chevron_left_circle, size: 30),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               context.push(AppRouteStrings.howToUseScreen);
//             },
//             icon: Icon(CupertinoIcons.question_circle, size: 30),
//           ),
//         ],
//
//         title: Text(
//           widget.lovable.title,
//           style: size20TextStyle(
//             fontFamily: AppStrings.playfairDisplay,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: BlocBuilder<PromptBloc, PromptState>(
//         builder: (context, state) {
//           if (state.status == Status.success) {
//             Column(
//               children: [
//                 Container(
//                   width: 343.w,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.r),
//                     border: Border.all(color: AppColors.cream, width: 1),
//                   ),
//                 ),
//                 SizedBox(height: 15.h),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     padding: EdgeInsets.symmetric(
//                       vertical: 9.h,
//                       horizontal: 50.w,
//                     ),
//                   ),
//                   onPressed: () {}, // open gemini
//                   child: Row(
//                     children: [
//                       Image.asset(AppIcons.gemini, height: 24.h),
//                       Text(
//                         AppStrings.openInGeminiAI,
//                         style: size18TextStyle(
//                           fontFamily: AppStrings.playfairDisplay,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 14.h),
//                 Row(
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {},
//                       child: Row(
//                         children: [
//                           Text(AppStrings.copyPrompt, style: size16TextStyle()),
//                         ],
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {},
//                       child: Row(
//                         children: [
//                           Text(
//                             AppStrings.sharePrompt,
//                             style: size16TextStyle(),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             );
//           }
//           return SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(height: 8.h),
//                 Stack(
//                   children: [
//                     Image.asset(widget.lovable.image),
//                     Positioned(
//                       top: 15.h,
//                       right: 15.w,
//                       child: Image.asset(AppIcons.heart),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20.h),
//                 (state.status == Status.loading)
//                     ? CircularProgressIndicator()
//                     : ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.darkYellow,
//                           padding: EdgeInsets.symmetric(
//                             vertical: 8.h,
//                             horizontal: 100.w,
//                           ),
//                         ),
//                         onPressed: () {
//                           context.read<PromptBloc>().add(LoadData());
//                         },
//                         child: Text(
//                           AppStrings.letsCreateMagic,
//                           style: size18TextStyle(textColor: AppColors.black),
//                         ),
//                       ),
//                 SizedBox(height: 20.h),
//                 Container(
//                   height: 241.h,
//                   width: 375.w,
//                   color: AppColors.black,
//                   child: Center(
//                     child: Text(
//                       AppStrings.adBanner,
//                       style: size18TextStyle(textColor: AppColors.white1),
//                     ),
//                   ),
//                 ),
//                 // SizedBox(height: 15.h),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 16.w,
//                     vertical: 20.h,
//                   ),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Column(
//                       children: [
//                         Text(
//                           textAlign: TextAlign.left,
//                           AppStrings.relatedPrompts,
//                           style: size18TextStyle(),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 GridView.builder(
//                   padding: EdgeInsets.symmetric(horizontal: 16.w),
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemCount: relatedPrompts.length,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     mainAxisExtent: 315,
//                     crossAxisSpacing: 25,
//                     mainAxisSpacing: 20,
//                     childAspectRatio: .50,
//                   ),
//                   itemBuilder: (context, index) {
//                     return CustomGridItem(
//                       category: relatedPrompts[index],
//                       onTap: () {},
//                     );
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
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
import 'package:wedding_prompt_app/features/promptscreen/bloc/prompt_event.dart';
import 'package:wedding_prompt_app/features/promptscreen/bloc/prompt_state.dart';
import 'package:wedding_prompt_app/routs/app_route_strings.dart';

import '../../core/constants/app_images.dart';
import '../favoritescreen/widget/custom_grid_item.dart';
import '../homescreen/models/categories_model.dart';

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
            onPressed: () => context.push(AppRouteStrings.howToUseScreen),
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
          // SUCCESS UI
          if (state.status == Status.success) {
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

                  // SUCCESS PROMPT BOX
                  Container(
                    width: 343.w,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: AppColors.cream),
                    ),
                  ),

                  SizedBox(height: 15.h),

                  // OPEN IN GEMINI BUTTON
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 16.w,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkYellow,
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppIcons.gemini, height: 24.h),
                          SizedBox(width: 10),
                          Text(
                            AppStrings.openInGeminiAI,
                            style: size18TextStyle(
                              fontFamily: AppStrings.playfairDisplay,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  // Copy & Share Button
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
                  SizedBox(height: 20.h),
                  Container(
                    color: AppColors.black,
                    height: 70.h,
                    child: Center(
                      child: Text(
                        AppStrings.adBanner,
                        style: size18TextStyle(textColor: AppColors.white1),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  relatedPromptSection(),
                ],
              ),
            );
          }

          // LOADING + DEFAULT UI

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

                // LOADER OR CREATE BUTTON
                (state.status == Status.loading)
                    ? CircularProgressIndicator()
                    : ElevatedButton(
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
                      ),

                SizedBox(height: 20.h),

                // SHOW AD ONLY IF NOT LOADING
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

                SizedBox(height: 20.h),
                if (state.status != Status.loading) relatedPromptSection(),
              ],
            ),
          );
        },
      ),
    );
  }

  // Related Prompts Grid

  Widget relatedPromptSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(AppStrings.relatedPrompts, style: size18TextStyle()),
        ),
        SizedBox(height: 10.h),
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
