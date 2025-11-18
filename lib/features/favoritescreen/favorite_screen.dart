import 'package:flutter/material.dart';
import 'package:wedding_prompt_app/core/constants/app_colors.dart';
import 'package:wedding_prompt_app/core/constants/app_strings.dart';
import 'package:wedding_prompt_app/core/utils/text_styles.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.navBarFavorite,
          style: size22TextStyle(textColor: AppColors.red),
        ),
        centerTitle: true,
      ),
      body: Text(
        AppStrings.categories,
        style: size18TextStyle(textColor: AppColors.black),
      ),
    );
  }
}
