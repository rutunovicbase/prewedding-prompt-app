import 'package:flutter/material.dart';
import 'package:wedding_prompt_app/core/constants/app_colors.dart';
import 'package:wedding_prompt_app/core/constants/app_images.dart';
import 'package:wedding_prompt_app/core/constants/app_strings.dart';
import 'package:wedding_prompt_app/core/utils/text_styles.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(AppImages.onboarding1, fit: BoxFit.cover),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [AppColors.white, AppColors.transparent],
                    stops: [0.25, 0.65],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 83),
                  child: SizedBox(
                    // width: 343,
                    // height: 206,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          AppStrings.celebrateYourLoveTheModernWay,
                          style: size30TextStyle(textColor: AppColors.darkRed),
                        ),
                        SizedBox(height: 12),
                        RichText(
                          text: TextSpan(
                            text: AppStrings.aiWedMaker1,
                            style: size14TextStyle(
                              textColor: AppColors.darkRed,
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              TextSpan(
                                text: AppStrings.message1,
                                style: size14TextStyle(
                                  textColor: AppColors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(AppStrings.skip),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(AppStrings.next),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
