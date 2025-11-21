import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:wedding_prompt_app/core/constants/app_strings.dart';
import 'package:wedding_prompt_app/features/homescreen/models/categories_model.dart';

import '../../../core/constants/app_images.dart';
import 'homes_event.dart';
import 'homes_state.dart';

class HomesBloc extends Bloc<HomesEvent, HomesState> {
  Timer? _timer;

  HomesBloc() : super(HomesState.initial()) {
    on<SliderTimer>(_onSliderTimer);
    on<SliderIndex>(_onSliderIndex);
  }
  final List<CategoriesModel> sliderImage = [
    CategoriesModel(
      image: AppImages.slider1,
      title: AppStrings.theRoyalPreWedding,
    ),
    CategoriesModel(
      image: AppImages.slider2,
      title: AppStrings.thePerfectMehndi,
    ),
    CategoriesModel(image: AppImages.slider3, title: AppStrings.discoSangeet),
    CategoriesModel(
      image: AppImages.slider4,
      title: AppStrings.gardernPreWedding,
    ),
  ];

  Future<void> _onSliderTimer(
    SliderTimer event,
    Emitter<HomesState> emit,
  ) async {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      add(SliderIndex());
    });
  }

  Future<void> _onSliderIndex(
    SliderIndex event,
    Emitter<HomesState> emit,
  ) async {
    final next = (state.currentIndex + 1) % sliderImage.length;
    emit(state.copyWith(currentIndex: next)); // SAFE
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
