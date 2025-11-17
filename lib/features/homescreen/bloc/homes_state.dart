class HomesState {
  final int currentIndex;

  HomesState({this.currentIndex = 0});
  factory HomesState.initial() {
    return HomesState();
  }
  HomesState copyWith({int? currentIndex}) {
    return HomesState(currentIndex: currentIndex ?? this.currentIndex);
  }
}
