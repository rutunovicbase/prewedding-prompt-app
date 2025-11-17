import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState.initial());

  void currentPage(int index) {
    Future.delayed(Duration(milliseconds: 100), () {
      emit(state.copyWith(index));
    });
  }
}
