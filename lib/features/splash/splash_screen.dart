import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_prompt_app/core/constants/app_colors.dart';
import 'package:wedding_prompt_app/core/constants/app_strings.dart';
import 'package:wedding_prompt_app/core/utils/text_styles.dart';
import 'package:wedding_prompt_app/routs/app_route_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    wait();
    super.initState();
  }

  wait() {
    Future.delayed(Duration(seconds: 2), () {
      if (!mounted) return;
      (context).go(AppRouteStrings.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.aiWedMaker,
          style: size32TextStyle(textColor: AppColors.darkRed),
        ),
      ),
    );
  }
}
