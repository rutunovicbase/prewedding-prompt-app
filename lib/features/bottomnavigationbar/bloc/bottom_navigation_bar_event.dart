abstract class BottomNavigationBarEvent {}

class NavBarIndex extends BottomNavigationBarEvent {
  int currentNavBarIndex;
  NavBarIndex(this.currentNavBarIndex);
}
