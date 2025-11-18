class BottomNavigationBarState {
  final int currentNavBarIndex;

  BottomNavigationBarState({this.currentNavBarIndex = 0});
  factory BottomNavigationBarState.initial() {
    return BottomNavigationBarState();
  }
  BottomNavigationBarState copyWith({int? currentNavBarIndex}) {
    return BottomNavigationBarState(
      currentNavBarIndex: currentNavBarIndex ?? this.currentNavBarIndex,
    );
  }
}
