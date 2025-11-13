import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/constants/app_images.dart';

part 'homescreen_event.dart';
part 'homescreen_state.dart';

class HomescreenBloc extends Bloc<HomescreenEvent, HomescreenState> {
  HomescreenBloc() : super(HomescreenInitial()) {
    // on<HomescreenEvent>((event, emit) {});
  }
  final List sliderImage = [
    AppImages.slider1,
    AppImages.slider2,
    AppImages.slider3,
    AppImages.slider4,
  ];

  // final List<Map<String, String>> categories = [
  //   {"title": AppStrings.preWedding},
  //   {"title": AppStrings.engagement},
  //   {"title": AppStrings.sangeet},
  //   {"title": AppStrings.haldi},
  //   {"title": AppStrings.mehndi},
  //   {"title": AppStrings.grahpravesh},
  // ];
}
