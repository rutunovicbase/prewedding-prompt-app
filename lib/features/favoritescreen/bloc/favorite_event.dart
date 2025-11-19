abstract class FavoriteEvent {}

class SelectedIndex extends FavoriteEvent {
  int selectedIndex;
  SelectedIndex(this.selectedIndex);
}
