import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:wedding_prompt_app/core/constants/app_strings.dart';

import '../../../core/constants/app_images.dart';
import 'homescreen_event.dart';
import 'homescreen_state.dart';

class HomescreenBloc extends Bloc<HomescreenEvent, HomescreenState> {
  Timer? _timer;

  HomescreenBloc() : super(HomescreenState.initial()) {
    on<SliderTimer>(_onSliderTimer);
    on<SliderIndex>(_onSliderIndex);
  }

  final List<Map<String, String>> sliderImage = [
    {"Image": AppImages.slider1, "title": AppStrings.theRoyalPreWedding},
    {"Image": AppImages.slider2, "title": AppStrings.thePerfectMehndi},
    {"Image": AppImages.slider3, "title": AppStrings.discoSangeet},
    {"Image": AppImages.slider4, "title": AppStrings.gardernPreWedding},
  ];

  Future<void> _onSliderTimer(
    SliderTimer event,
    Emitter<HomescreenState> emit,
  ) async {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      add(SliderIndex());
    });
  }

  Future<void> _onSliderIndex(
    SliderIndex event,
    Emitter<HomescreenState> emit,
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
