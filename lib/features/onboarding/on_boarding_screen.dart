import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wedding_prompt_app/core/constants/app_colors.dart';
import 'package:wedding_prompt_app/core/constants/app_images.dart';
import 'package:wedding_prompt_app/core/constants/app_strings.dart';
import 'package:wedding_prompt_app/core/utils/text_styles.dart';
import 'package:wedding_prompt_app/features/onboarding/bloc/onboarding_cubit.dart';
import 'package:wedding_prompt_app/routs/app_route_strings.dart';

import 'model/onboarding_page_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    context.read<OnboardingCubit>().currentPage(0);
    super.initState();
  }

  final PageController _controller = PageController();

  Widget _buildPage1Subtitle() {
    return RichText(
      text: TextSpan(
        text: AppStrings.aiWedMaker1,
        style: size14TextStyle(
          textColor: AppColors.darkRed,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: AppStrings.subTitlePage1,
            style: size14TextStyle(
              textColor: AppColors.black,
              fontWeight: FontWeight.w600,
              fontFamily: AppStrings.playfairDisplay,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<OnboardingPageModel> pages = [
      OnboardingPageModel(
        image: AppImages.onboarding1,
        title: AppStrings.titlePage1,
        subtitle: AppStrings.subTitlePage1,
        subTitleWidget: _buildPage1Subtitle(),
      ),
      OnboardingPageModel(
        image: AppImages.onboarding2,
        title: AppStrings.titlePage2,
        subtitle: AppStrings.subTitlePage2,
      ),
      OnboardingPageModel(
        image: AppImages.onboarding3,
        title: AppStrings.titlePage3,
        subtitle: AppStrings.subTitlePage3,
      ),
    ];

    return Scaffold(
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          final page = pages[state.currentIndex];
          return Stack(
            children: [
              PageView.builder(
                // scrollDirection: Axis.vertical,
                controller: _controller,
                onPageChanged: (index) {
                  context.read<OnboardingCubit>().currentPage(index);
                },
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  final page = pages[index];
                  return Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Image.asset(page.image, fit: BoxFit.cover),
                      ).animate().fadeIn(duration: 500.ms).then(delay: 100.ms),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [AppColors.white, AppColors.transparent],
                            stops: [0.25, 0.60],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      page.title,
                      style: size30TextStyle(
                        height: 1.3,
                        textColor: AppColors.darkRed,
                        fontFamily: AppStrings.playfairDisplay,
                      ),
                    ),
                    SizedBox(height: 12),
                    (page.subTitleWidget != null)
                        ? page.subTitleWidget ?? SizedBox.shrink()
                        : Text(
                            page.subtitle,
                            style: size14TextStyle(
                              textColor: AppColors.black,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppStrings.playfairDisplay,
                            ),
                          ),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.center,
                      child: SmoothPageIndicator(
                        controller: _controller,
                        count: pages.length,
                        effect: WormEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          spacing: 6,
                          activeDotColor: AppColors.darkYellow,
                          dotColor: AppColors.cream,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    (state.currentIndex != 2)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => _controller.animateToPage(
                                  2,
                                  duration: const Duration(milliseconds: 700),
                                  curve: Curves.decelerate,
                                ),
                                child: Text(
                                  AppStrings.skip,
                                  style: size16TextStyle(
                                    textColor: AppColors.black,
                                    fontFamily: AppStrings.playfairDisplay,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.darkYellow,
                                ),
                                onPressed: () => _controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.linear,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.w,
                                    vertical: 10.h,
                                  ),
                                  child: Text(
                                    AppStrings.next,
                                    style: size16TextStyle(
                                      textColor: AppColors.black,
                                      fontFamily: AppStrings.playfairDisplay,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.darkYellow,
                              ),
                              onPressed: () =>
                                  (context).go(AppRouteStrings.bottomNavBar),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 35.w,
                                  vertical: 10.h,
                                ),
                                child: Text(
                                  AppStrings.letsCreateMagic,
                                  style: size16TextStyle(
                                    fontFamily: AppStrings.playfairDisplay,
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
          );
        },
      ),
    );
  }
}
