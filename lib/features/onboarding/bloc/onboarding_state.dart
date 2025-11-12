part of 'onboarding_cubit.dart';

class OnboardingState {
  int currentIndex;

  OnboardingState({this.currentIndex = 0});

  factory OnboardingState.initial() {
    return OnboardingState(currentIndex: 0);
  }
  OnboardingState copyWith(int? currentIndex) {
    return OnboardingState(currentIndex: currentIndex ?? this.currentIndex);
  }
}
