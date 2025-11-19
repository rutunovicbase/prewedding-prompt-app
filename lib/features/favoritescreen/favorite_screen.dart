import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_prompt_app/core/constants/app_colors.dart';
import 'package:wedding_prompt_app/core/constants/app_strings.dart';
import 'package:wedding_prompt_app/core/utils/text_styles.dart';

import 'bloc/favorite_bloc.dart';
import 'bloc/favorite_state.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<String> topCategoriesList = [
    AppStrings.all,
    AppStrings.preWedding,
    AppStrings.sangeet,
    AppStrings.haldi,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppStrings.navBarFavorite,
              style: size22TextStyle(textColor: AppColors.red),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Text(
                AppStrings.categories,
                style: size18TextStyle(textColor: AppColors.black),
              ),
              Row(
                children: List.generate(topCategoriesList.length, (index) {
                  final bool isSelected = state.selectedIndex == index;

                  return GestureDetector(
                    onTap: () => state.selectedIndex == index,
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors
                                  .darkYellow // selected bg (gold)
                            : AppColors.white, // normal bg
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.cream,
                          width: isSelected ? 0 : 1,
                        ),
                      ),
                      child: Text(
                        topCategoriesList[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.black : Colors.brown,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
