import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_prompt_app/core/constants/app_icons.dart';
import 'package:wedding_prompt_app/features/homescreen/bloc/homescreen_bloc.dart';
import 'package:wedding_prompt_app/features/homescreen/bloc/homescreen_event.dart';
import 'package:wedding_prompt_app/features/homescreen/bloc/homescreen_state.dart';

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
    context.read<HomescreenBloc>().add(SliderTimer());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomescreenBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.aiWedMaker,
          style: size20TextStyle(textColor: AppColors.darkRed),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          BlocBuilder<HomescreenBloc, HomescreenState>(
            builder: (context, state) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                switchOutCurve: Curves.decelerate,
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: Stack(
                  children: [
                    SizedBox(
                      height: 280,
                      child: Image.asset(
                        bloc.sliderImage[state.currentIndex]["Image"]!,
                        key: ValueKey<int>(bloc.state.currentIndex),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 370,
                        top: 18,
                        right: 18,
                      ),
                      child: SizedBox(
                        height: 30,
                        child: Image.asset(AppIcons.heart, fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      top: 215,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 25,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.darkRed,
                                    AppColors.darkYellow,
                                    AppColors.transparent,
                                  ],
                                  stops: [0.3, 0.1, 1.0],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 2.5,
                                  bottom: 2.5,
                                  right: 8.5,
                                  left: 8.5,
                                ),
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
                            ElevatedButton(
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              right: 16,
              left: 16,
              bottom: 15,
            ),
            child: SizedBox(
              height: 22,
              width: 365,
              child: Text(
                AppStrings.lovableCategories,
                style: size18TextStyle(),
              ),
            ),
          ),
          Container(width: 365, child: Row()),
        ],
      ),
    );
  }
}
