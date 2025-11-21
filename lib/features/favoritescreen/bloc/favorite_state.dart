class FavoriteState {
  final int selectedIndex;

  FavoriteState({this.selectedIndex = 0});
  factory FavoriteState.initial() {
    return FavoriteState();
  }
  FavoriteState copyWith({int? selectedIndex}) {
    return FavoriteState(selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}
