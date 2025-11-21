import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_prompt_app/core/constants/app_strings.dart';
import 'package:wedding_prompt_app/core/utils/text_styles.dart';
import 'package:wedding_prompt_app/features/homescreen/models/categories_model.dart';
import 'package:wedding_prompt_app/routs/app_route_strings.dart';

class CategoriesScreen extends StatefulWidget {
  final CategoriesModel category;

  const CategoriesScreen({super.key, required this.category});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop(AppRouteStrings.homeScreen);
          },
          icon: Icon(CupertinoIcons.chevron_left_circle),
        ),
        title: Text(
          widget.category.title,
          style: size22TextStyle(fontFamily: AppStrings.playfairDisplay),
        ),
      ),
    );
  }
}
