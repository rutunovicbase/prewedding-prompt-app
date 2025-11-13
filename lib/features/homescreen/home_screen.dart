import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_prompt_app/core/constants/app_colors.dart';
import 'package:wedding_prompt_app/core/constants/app_strings.dart';
import 'package:wedding_prompt_app/core/utils/text_styles.dart';
import 'package:wedding_prompt_app/features/homescreen/bloc/homescreen_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          SizedBox(height: 10),
          SizedBox(
            height: 250,
            child: CarouselSlider(
              items: bloc.sliderImage.map((imagePath) {
                return Builder(
                  builder: (context) {
                    return Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                autoPlayCurve: Curves.decelerate,
                height: 250,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                viewportFraction: 1,
              ),
            ),
          ),
          Container(
            width: 343,
            height: 22,
            // child: Text(AppStrings.lovableCategories,style: si,),
          ),
        ],
      ),
    );
  }
}
