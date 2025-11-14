class HomescreenState {
  final int currentIndex;

  HomescreenState({this.currentIndex = 0});
  factory HomescreenState.initial() {
    return HomescreenState();
  }
  HomescreenState copyWith({int? currentIndex}) {
    return HomescreenState(currentIndex: currentIndex ?? this.currentIndex);
  }
}
