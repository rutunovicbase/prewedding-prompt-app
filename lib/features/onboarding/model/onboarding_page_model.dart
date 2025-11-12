import 'package:flutter/material.dart' show Widget;

class OnboardingPageModel {
  final String image;
  final String title;
  final String subtitle;
  final Widget? subTitleWidget;

  OnboardingPageModel({
    required this.image,
    required this.title,
    required this.subtitle,
    this.subTitleWidget,
  });
}
