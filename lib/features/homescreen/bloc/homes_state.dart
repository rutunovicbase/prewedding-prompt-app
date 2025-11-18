class HomesState {
  final int currentIndex;
  final int navbarIndex;

  HomesState({this.currentIndex = 0, this.navbarIndex = 0});
  factory HomesState.initial() {
    return HomesState();
  }
  HomesState copyWith({int? currentIndex, int? navbarIndex}) {
    return HomesState(
      currentIndex: currentIndex ?? this.currentIndex,
      navbarIndex: navbarIndex ?? this.navbarIndex,
    );
  }
}
