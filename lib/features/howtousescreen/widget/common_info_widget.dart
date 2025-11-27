import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding_prompt_app/core/constants/app_strings.dart';
import 'package:wedding_prompt_app/core/utils/text_styles.dart';

class CommonInfoWidget extends StatelessWidget {
  final String title;
  final String description;
  final String icon;
  const CommonInfoWidget({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
          child: Row(
            children: [
              Image.asset(icon, height: 24.h),
              SizedBox(width: 5.w),
              Text(
                title,
                style: size18TextStyle(fontFamily: AppStrings.playfairDisplay),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 22),
          width: 300.w,
          child: Text(
            textAlign: TextAlign.justify,
            description,
            style: size14TextStyle(
              fontFamily: AppStrings.playfairDisplay,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}
