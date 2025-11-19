import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding_prompt_app/core/constants/app_colors.dart';
import 'package:wedding_prompt_app/core/constants/app_icons.dart';
import 'package:wedding_prompt_app/core/constants/app_strings.dart';
import 'package:wedding_prompt_app/core/utils/text_styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.navBarProfile,
          style: size22TextStyle(
            textColor: AppColors.red,
            fontFamily: AppStrings.playfairDisplay,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            CustomTile(
              title: AppStrings.rateUs,
              iconPath: AppIcons.rateUs,
              onTap: () {},
            ),
            SizedBox(height: 10),
            CustomTile(
              title: AppStrings.shareApp,
              iconPath: AppIcons.shareApp,
              onTap: () {},
            ),
            SizedBox(height: 10),
            CustomTile(
              title: AppStrings.privacyPolicy,
              iconPath: AppIcons.privacyPolicy,
              onTap: () {},
            ),
            Container(
              height: 70.h,
              width: double.infinity.w,
              color: AppColors.black,
              child: Center(
                child: Text(
                  AppStrings.adBanner,
                  style: size18TextStyle(
                    textColor: AppColors.white,
                    fontFamily: AppStrings.playfairDisplay,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;

  const CustomTile({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(11),
        height: 45.h,
        width: 350.w,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.amber, width: 0.6),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Image.asset(iconPath),
            SizedBox(width: 10.w),
            Text(
              title,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
            Spacer(),
            Icon(CupertinoIcons.chevron_right_circle, size: 24),
          ],
        ),
      ),
    );
  }
}
